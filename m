Received: from out203-205-221-155.mail.qq.com (out203-205-221-155.mail.qq.com [203.205.221.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C43F434A
	for <linux-staging@lists.linux.dev>; Thu, 17 Feb 2022 15:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1645112795;
	bh=uPF+2bN3BhUMtB3HE0L6AB4knqomSQEQRNJEz5GSk+U=;
	h=From:To:Cc:Subject:Date;
	b=vMnFQqbQB40E8RzFuyeAXJdRGVY82Y2F0YGlByskapLSKAIJaB93EkaSfiRaW0zGw
	 Ul/GuZTx5PKcrSygYtovSvGHnJ+PVa0kGluHr6igbFbZrsvrwUuDN7vLMK80+ph1TS
	 dOs+LNqq96dVcBb7AdCAFzahM3dk+D9wMT1PqoGY=
Received: from localhost.localdomain ([218.197.153.188])
	by newxmesmtplogicsvrsza9.qq.com (NewEsmtp) with SMTP
	id 7BA1B2BD; Thu, 17 Feb 2022 23:30:58 +0800
X-QQ-mid: xmsmtpt1645111858tfvj2j1uk
Message-ID: <tencent_9C9780638BA22F9C5709F0DF190480393905@qq.com>
X-QQ-XMAILINFO: MgQY1K25Ph0m5cskmfXkJHQq2KMd2PO7D8cRZg+ulKAEXYDg5DXRAcaR5T/MV/
	 ShhKupnc5u8DkDw+dO7XV/E7ZUsVJYmRZgUBBvsZIUKCV3D4LGI8lvMZzM2UhgOHR/pRFmGS9YWZ
	 lYgygRfxXDHhC2i+j7pBbMC64IK32zK/9+m6KLaxGd7vyvo4NNAehqYfnm894AlR0IIMRTkCNOGO
	 sUkUpuuhYHEtXWCDPl5kvLf3i6Ic8/bniQy8k2wvy5lkJhD6nk8mEmvJ0t1mV5KYxsqH9VWto23J
	 bv5GzGF+PWFgMqHqL5oEaWeZ4wW1lYfFxe6DbDn9MJbKXJdNWyo/f5yRGzUv2QDY8s1yIwvD78lG
	 HXIc7HrYcX4XuCpCk4UFk8hkd562cIhGtmHEI5zml+XvkpaZn9IthDIIsYF7PA6uqjX5xtxs5D31
	 wS0wb0s7FSvXVSVVIZq0yJhOA8oGPBkhokZlSSheS999InZ4G/QDxCeoOUYUkJP43ujRspP+FLIh
	 k2mtvx60TSGpQgMDU1G4SKsTWSi0ynHrl6laKPDaV+Eu2AaGSR8fdI0e0MnRM/ogk5FP1GCiaQsa
	 sHACIYEvyG1JUZCA9jMlPepYcw1+WqEN8u2cQApJpNRqu0RrBVxIvSUUpAKH372aFsoYfeGwFVYi
	 afU9MI6igF8i0hEU5YGKyy8pnCzjB1XximbGNE5O91cm8Rujgd8LY+o6YlIcmO2NStm/VPHTGsJ8
	 ZMWgmIh8AeFJquvlgL0gtb/R31XjE7YPZO13z3H953m4znmgZUHtJdyiIo3mVQS7HTk1q8qMeQig
	 Dq2IrMfxbf3TtWiwsNY/W2n8iiv4nrkpSWFdc06lyNLUmbSSCgHhxFSCO8F2uaQOJCZhOVYu+bU1
	 U3HPY7rVlB7yqUaARTytA21bP+frAAPdYI0d0W7x1qgHidQvQ5WwDFwz9E5gYxftXch5KhyPxL
From: xkernel.wang@foxmail.com
To: jerome.pouiller@silabs.com,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xiaoke Wang <xkernel.wang@foxmail.com>
Subject: [PATCH v3] staging: wfx: check the return value of devm_kmalloc()
Date: Thu, 17 Feb 2022 23:30:23 +0800
X-OQ-MSGID: <20220217153023.1050-1-xkernel.wang@foxmail.com>
X-Mailer: git-send-email 2.33.0.windows.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Xiaoke Wang <xkernel.wang@foxmail.com>

devm_kmalloc() returns a pointer to allocated memory on success, NULL
on failure. While there is a memory allocation of devm_kmalloc()
without proper check. It is better to check the return value of it to
prevent wrong memory access.

Signed-off-by: Xiaoke Wang <xkernel.wang@foxmail.com>
---
Changelog:
v2-v3 use the err label.
 drivers/staging/wfx/main.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/staging/wfx/main.c b/drivers/staging/wfx/main.c
index f83df9f..5d4fcc3 100644
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
-- 
