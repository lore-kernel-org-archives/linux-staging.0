Received: from out162-62-58-211.mail.qq.com (out162-62-58-211.mail.qq.com [162.62.58.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF6C28EA
	for <linux-staging@lists.linux.dev>; Wed, 16 Feb 2022 12:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1645014603;
	bh=9JU/7J0kbeMSD+qpS/qZQu81EhTBuGTtEd6JH+Xwt2A=;
	h=From:To:Cc:Subject:Date;
	b=Y6lClbH+b6nl7GFyk7SdmZjTBhaPUCzNXQUAJKl/0yy32k0QtJmCu+MSQJpuGwhHK
	 m21Q3nOh67gaNo/pmGBUiOT+aom6rr2Lrfnry9yHoni026q+Bv9gbMwOu6jnhzlHjx
	 czuLrfZZf0SGB/oVBE9v9ygc3h8WxrFgSjNX2cME=
Received: from localhost.localdomain ([218.197.153.188])
	by newxmesmtplogicsvrsza8.qq.com (NewEsmtp) with SMTP
	id 6A83DAED; Wed, 16 Feb 2022 20:26:40 +0800
X-QQ-mid: xmsmtpt1645014400tukomum8s
Message-ID: <tencent_437C4189E07F1CC482B923779E839DA23005@qq.com>
X-QQ-XMAILINFO: MMnP0fEUKo/hcd9hvtysc5OMCNpMZGfavEFS8FaH0AWxwAjiD4Q7uySjpiFk4O
	 oSfonpIvzkHLbPn4xO7woaTDI9Xw4qUnribz74vmpXs5PwbzpG+lwryzf0nxyaAyMpuMKLrhJdQH
	 AHqeT5nkIGLKdKhDxFeXxVof9bn190NMSCgQY33VqEkE1xOYkp3Did9+qX5lN8V0oCl8VtxhXfzQ
	 mTh1DKJIDYtoulLqdXvOMzbN4b8onBkiGqnTa/lUTwVgrsO0NJwaK09+1s/uSSy7n5ev6i9BhqcM
	 qIcl9R5erW0eF8YURM/v2zOEsSzb8dNIFC2zplJq5srXiireBqIvwOcPWhndwMNT0J1RyUcuheGK
	 gR7LAenx+pgsQo5woayeLJs4QhUg/Mf6g8tSHF4jy/O+QSUXz11z1439qOpWv4ow7pnQg+P93Uc0
	 aM281e45cXx0L/49T/5lBm+w7WFoeMxhf4puj3KaL2KUsW4ZpJZjiLgTz+mQvuVniZ3jciR1OxIY
	 kwidOLiiiitBlGKvLHFDdVeQeJAkgQRbvEZxQnoPytWcp5DOEf0LL5iFCxyVHmQJgGjm/0LN6cBR
	 8/7vKeETIrc1+nj82/CF683xMo5/qSwqxiGO2VeudFuHiamvQ2f4yNKSESBJCy4oq4guKd9St/wg
	 3zxogTcy5tikjXlqyyWRsOwmKCiRomDiqpuTlPGgPPQtaM9Zld3f4wcYOERzVoHnu9N9AzxlWiSV
	 FVeo7B+m6eVxOA+yB9HddaGUsLlnoMSYaZOf4TEWK9Kl2LrBX0UDlvfcj3ut4ooZ2Gi99MbxP6qL
	 BARZRea4Vl5oDCx1HjI4u4Qjr+ewAhFpupe1bT0Sl8NZ738/VeZgnnVU5RkVvd+nFVcgbhu6GgA9
	 YyjE13fVX8fxSZB6XJq6VJRvksrF/VkQ==
From: xkernel.wang@foxmail.com
To: jerome.pouiller@silabs.com,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xiaoke Wang <xkernel.wang@foxmail.com>
Subject: [PATCH v2] staging: wfx: check the return value of devm_kmalloc()
Date: Wed, 16 Feb 2022 20:25:20 +0800
X-OQ-MSGID: <20220216122520.753-1-xkernel.wang@foxmail.com>
X-Mailer: git-send-email 2.33.0.windows.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Xiaoke Wang <xkernel.wang@foxmail.com>

devm_kmalloc() returns a pointer to allocated memory on success, NULL
on failure. While there is a memory allocation of devm_kmalloc()
without proper check. It is better to check the return value of it to
prevent wrong memory access.
By the way, all the error handlers of this function return without
calling ieee80211_free_hw(hw), which may result in memory leak. So I
add one err label to unify the error handler.

Suggested-by: Jérôme Pouiller <jerome.pouiller@silabs.com>
Signed-off-by: Xiaoke Wang <xkernel.wang@foxmail.com>
---
Changelog
v1->v2: add ieee80211_free_hw(hw) on error path.
 drivers/staging/wfx/main.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/wfx/main.c b/drivers/staging/wfx/main.c
index 4b9fdf9..5d4fcc3 100644
--- a/drivers/staging/wfx/main.c
+++ b/drivers/staging/wfx/main.c
@@ -294,6 +294,9 @@ struct wfx_dev *wfx_init_common(struct device *dev,
 	hw->wiphy->n_iface_combinations = ARRAY_SIZE(wfx_iface_combinations);
 	hw->wiphy->iface_combinations = wfx_iface_combinations;
 	hw->wiphy->bands[NL80211_BAND_2GHZ] = devm_kmalloc(dev, sizeof(wfx_band_2ghz), GFP_KERNEL);
+	if (!hw->wiphy->bands[NL80211_BAND_2GHZ])
+		goto err;
+
 	// FIXME: also copy wfx_rates and wfx_2ghz_chantable
 	memcpy(hw->wiphy->bands[NL80211_BAND_2GHZ], &wfx_band_2ghz,
 	       sizeof(wfx_band_2ghz));
@@ -309,7 +312,8 @@ struct wfx_dev *wfx_init_common(struct device *dev,
 	wdev->pdata.gpio_wakeup = devm_gpiod_get_optional(dev, "wakeup",
 							  GPIOD_OUT_LOW);
 	if (IS_ERR(wdev->pdata.gpio_wakeup))
-		return NULL;
+		goto err;
+
 	if (wdev->pdata.gpio_wakeup)
 		gpiod_set_consumer_name(wdev->pdata.gpio_wakeup, "wfx wakeup");
 
@@ -325,9 +329,13 @@ struct wfx_dev *wfx_init_common(struct device *dev,
 	wdev->force_ps_timeout = -1;
 
 	if (devm_add_action_or_reset(dev, wfx_free_common, wdev))
-		return NULL;
+		goto err;
 
 	return wdev;
+
+err:
+	ieee80211_free_hw(hw);
+	return NULL;
 }
 
 int wfx_probe(struct wfx_dev *wdev)
-- 
