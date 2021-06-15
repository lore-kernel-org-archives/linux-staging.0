Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBEFA6D0F
	for <linux-staging@lists.linux.dev>; Tue, 15 Jun 2021 22:36:15 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id f2so291482wri.11
        for <linux-staging@lists.linux.dev>; Tue, 15 Jun 2021 15:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2Zdz/YG9U6kVK6aKVKn5GfU94WTJiZuN67dSZMEqKx8=;
        b=xmtwC/i1xM49cc+7sO0opfJPen2G6inIw3AO8/rH+4DTImX/OYGSuQMEGPxjTtulr5
         FsKQRlW5tIq9iOZJUneHLQi/PoAiPUGAjknFJCPwtLwsrHpFjeMCEYCXzd4hcC7rgP6w
         C9XrE8oaYDybbOlqULdcvMUW3g8GE/qfQRDdWkjqJT1OecyPwtvQCkOWpOn/kqeQQnZr
         +On374xUbDddCtSQ8T9LrqSamWH2qVKCJ83WvuCk/9iz+Lv7Tw5VILhZQe+hq6qSIWU7
         DFaEOHF4sWHSk4nfsu4lY4gL+ugjd6bB+JnkJRpC3ADU4LR6pbOOoRGUrrlR/Pl20Arn
         Znow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2Zdz/YG9U6kVK6aKVKn5GfU94WTJiZuN67dSZMEqKx8=;
        b=nFQnblaC6LySlz/Uh7Tg3Zbr+shRN0faZT7wE7x2B5PhGc7/cMJQFyyME+fuPGaqQ1
         6TRJa/48n8Q9X08EnysqG1Yxlm6DuEp1M2Z4IypBnYeeR06067M2XLu3BlRNqxnl9pjq
         tLPFpTX2m2QOe8F36nESzmSokoHS3JytTMEmAdQiwi3K/CKGiYE++ArVv3fkolgVbqde
         rmRHwimR2hp7stQV+jb4K6pX9QHgwypIy6JYxECdJDo5pk5Em/Wryq+X3hPQaWtVvung
         SRrDXREEbcrlL2LH5RnVqBVAa40QeBt+NKMxb3W/QiV52mvOZVLIJMVi16jR5H8JvRTY
         XWdQ==
X-Gm-Message-State: AOAM533Sj+IyoW2qCi9gwL0afCgYRXf464Q6hCkyiHU2SWYE4zUCBRmW
	rJxcgDkI6u62XmWp11xB6RBPF3TY6zQzSBNH
X-Google-Smtp-Source: ABdhPJxukMMl+EK8Lcs825AfFGrWHs4LakjqAAgly6LS3JUeVG4KTMKopraTHf7h/atxrBY13qCdmA==
X-Received: by 2002:adf:bd84:: with SMTP id l4mr1543482wrh.346.1623796574378;
        Tue, 15 Jun 2021 15:36:14 -0700 (PDT)
Received: from localhost.localdomain (2.0.5.1.1.6.3.8.5.c.c.3.f.b.d.3.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16:0:3dbf:3cc5:8361:1502])
        by smtp.gmail.com with ESMTPSA id m23sm3934791wml.27.2021.06.15.15.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 15:36:13 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	dan.carpenter@oracle.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 2/7] staging: rtl8188eu: use prefix decrement operator on trycnt variable
Date: Tue, 15 Jun 2021 23:36:02 +0100
Message-Id: <20210615223607.13863-3-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210615223607.13863-1-phil@philpotter.co.uk>
References: <20210615223607.13863-1-phil@philpotter.co.uk>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Modify trycnt condition in the do/while loop of rtw_hal_set_hwreg to use
a prefix decrement operator instead of postfix. As an unsigned 8-bit
integer, this value would actually be 255 after the end of the do/while
loop, which is almost certainly not what was intended. It is more
reasonable to assume a loop counter should be zero at the end of all
loop iterations. Indeed, the line following the loop previously contained
an if statement which assumed trycnt was 0, and therefore was never
triggered.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/rtl8188eu/hal/usb_halinit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8188eu/hal/usb_halinit.c b/drivers/staging/rtl8188eu/hal/usb_halinit.c
index 0c3f11411eae..dcdf868b394d 100644
--- a/drivers/staging/rtl8188eu/hal/usb_halinit.c
+++ b/drivers/staging/rtl8188eu/hal/usb_halinit.c
@@ -1657,7 +1657,7 @@ void rtw_hal_set_hwreg(struct adapter *Adapter, u8 variable, u8 *val)
 				do {
 					if (!(usb_read32(Adapter, REG_RXPKT_NUM) & RXDMA_IDLE))
 						break;
-				} while (trycnt--);
+				} while (--trycnt);
 
 				/* RQPN Load 0 */
 				usb_write16(Adapter, REG_RQPN_NPQ, 0x0);
-- 
2.30.2

