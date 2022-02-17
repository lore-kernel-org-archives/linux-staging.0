Received: from out203-205-251-73.mail.qq.com (out203-205-251-73.mail.qq.com [203.205.251.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 766E03B29
	for <linux-staging@lists.linux.dev>; Thu, 17 Feb 2022 15:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1645113016;
	bh=FihfJldaJ6r2xVuFS8/jwCVqViJT/Juw+yF0fIUwbtQ=;
	h=From:To:Cc:Subject:Date;
	b=FGnv0Sd3lH/HCkbtxfPeLtodkF9sG0MC6t1PfzuCHrFSWEatmBcM80ePAGTHgmcIM
	 SbEmRe3pyflwJ41FT1bkfTRhavZfCHlPwUUtLduxpwUZvKe2nhm0jZk2pEXV1FwmOp
	 +S3ZVaI70gcBI2hD0xwx8EvNQ/yQfIIvzHkor5AQ=
Received: from localhost.localdomain ([43.227.136.188])
	by newxmesmtplogicsvrsza8.qq.com (NewEsmtp) with SMTP
	id C45B0427; Thu, 17 Feb 2022 23:49:05 +0800
X-QQ-mid: xmsmtpt1645112945t18onsnd0
Message-ID: <tencent_8F1C1B14CFE19C4A05FF632068CCCBB92708@qq.com>
X-QQ-XMAILINFO: OLsBWtCIHsg697Kysr7zpcTjd0Mg8bLRDzZQyibbKfpYLc11O0ThEmPs+c8ocy
	 JVD+O9Jy3tlGls7vsqwNZrYea7gkf9n+icTWah2Emuj9H84UsrRd6jnqF3o7EQ2VBJxzPwxl0GZa
	 16y0aX9sAB3hophUTuMg/YkmPEpRzLWzvWgAZHKukE8zxk7aKUomASmvh9fZP/wc2Yy72wlRF9Z6
	 k1LZgCmrr3ogvFTMJozE0IDKDjMxdXrzemUuCepk+WvfEp0EIFghUPLahPjM/48l0MHsvBqF4sN1
	 lEu99Kp63p+eekWLUW8g/F3vlth4VyS9cCnbjZOWIyFGCshHeqtUATojGVw/e2kbn+iGiwUyDppM
	 q2w3S887pJJgUgic6fEbFAVwbqowvg7nJx6roE6w3CNhg6w4OXlstXMnjuvR9cX9DYcmoJt/hcvT
	 sGowFBiLg+j7Nxz/l9a2ndGzR2XebORDbANtoH6Kc/6a0FfEHkqSm9uwcxn5jDjWt1aFpAJ8O0GY
	 BP94XWCqPu9dIHRviNa6REaYQR3XpAWXRccKhr1BwhR9Rbd3Tg4NpiJazDsIJ3fEt1NYu4hO0Zpd
	 PwSuWNoGifLpRFs8LOTllpSHA3Rm4kStq2vXrzh1g2ApL9vjolhmQ7ugJf8KhViSnflNUUp6qbeW
	 B9fmjKyhi6/Lf902hZPKp774X4lvMWQOD0tteWVodfM6LUq5YGcVcbktq/IHclH9tldEfQKil++j
	 6cZ6fI8QUKQQsJW2T9O8QTnFKIw88anadllP1stEyFbqGK3M7xluZJj2qtKmIJs4qpTymqiwfSVl
	 W3eJiP2ulwnsK3d6bINyLGJuR0PYtVgS7/JYj6jWdxlq5Ltf5GGbq4CgygSnElbMb+PtNiJySTqH
	 8bk52Zrv9lGynKGPAz4R+jBhrDQ4ri2RcTsdipsqhF2HR6rPyf2c/ruFoMFobjvga0LetG7B+CWV
	 iuw7rhTddLXS2VzDel75gZ2zuuczhZF/RLOsM7kbS4p6JvcyKsyg==
From: xkernel.wang@foxmail.com
To: jerome.pouiller@silabs.com,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xiaoke Wang <xkernel.wang@foxmail.com>
Subject: [PATCH 1/2] staging: wfx: fix the error handling in wfx_init_common()
Date: Thu, 17 Feb 2022 23:47:21 +0800
X-OQ-MSGID: <20220217154722.1226-1-xkernel.wang@foxmail.com>
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

All the error handlers of wfx_init_common() return without calling
ieee80211_free_hw(hw), which may result in memory leak. So I add
one err label to unify the error handlers.

Suggested-by: Jérôme Pouiller <jerome.pouiller@silabs.com>
Signed-off-by: Xiaoke Wang <xkernel.wang@foxmail.com>
---
 drivers/staging/wfx/main.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/wfx/main.c b/drivers/staging/wfx/main.c
index 4b9fdf9..f83df9f 100644
--- a/drivers/staging/wfx/main.c
+++ b/drivers/staging/wfx/main.c
@@ -309,7 +309,8 @@ struct wfx_dev *wfx_init_common(struct device *dev,
 	wdev->pdata.gpio_wakeup = devm_gpiod_get_optional(dev, "wakeup",
 							  GPIOD_OUT_LOW);
 	if (IS_ERR(wdev->pdata.gpio_wakeup))
-		return NULL;
+		goto err;
+
 	if (wdev->pdata.gpio_wakeup)
 		gpiod_set_consumer_name(wdev->pdata.gpio_wakeup, "wfx wakeup");
 
@@ -325,9 +326,13 @@ struct wfx_dev *wfx_init_common(struct device *dev,
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
