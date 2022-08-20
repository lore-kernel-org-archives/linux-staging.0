Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA73F320F
	for <linux-staging@lists.linux.dev>; Sat, 20 Aug 2022 18:16:46 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id t5so9131408edc.11
        for <linux-staging@lists.linux.dev>; Sat, 20 Aug 2022 11:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=+gbZ+oN4SNG8rEc+ME/YtcZCnc3X1ePwf/x65RNZ3kM=;
        b=BYZya6PP+0hwGkgRVKYMSNMHtfJxzJNgNXJCkJuXFR/ELJZ2PgABp0Sn/DYTU+7NGW
         GT9/YKIWzsuWjUVvjCLL2FJA+/k5ZHuxAG8DsVdz+/Ba95l93eWcJ6pfyW5RLDQ+dD+h
         dI0NjeplNbn7qM9Ql4RasukxulLInv5PjQ0LHO7R3zxyp262TxKAjJQSLBVDmpanG++U
         Y6lBSuFzdo7jejWgwxHwY5AXE+KZtIcd43Dh4v+3gQ471Ggxx3ElwfCSW6DLbddHFKwd
         SC7c/XhPoDGMUKa1ULhXhBRdmxS7j4nRrdNXZ5GQ6uN81aVHA4J26HnCm6tm2VJAjNz9
         7WxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=+gbZ+oN4SNG8rEc+ME/YtcZCnc3X1ePwf/x65RNZ3kM=;
        b=IHML9cYJqZS5zpEZ6i9ceyVHIPeqvJGxFiD1YXafk6VUvISZnH6dKHXKWCtnWV9uvt
         c3+3lEZXahqJEKjHSUPhayraFG9sR1aRBCP6k53NppQN73xn42PFsWqv31fMMEJr09yc
         tBoaoSPLSwVJxLsQd3de5ZgPpHY9I3Yt/2ahO/m00ZXDYpy0Zz79fk6u0zj79GakuPbq
         cFVaMDU/isPtCPveRxE1fPnx8nf2vGvtHzVRlS5wH3IaMk61ZG4gDOvufq9JYY2+z9b3
         B9kIkza9nip02eZomUwNp/4ezbxEP7cujca0u1ZF+2uMESkYCvlHvlR2x5gQz0Sea+Qn
         Z7Eg==
X-Gm-Message-State: ACgBeo3LIbiljMf49O8kQolB3xZrhGYgZFrk7izgNOtXNKRIyeN2qd5S
	tuFDPWbY7QVUTGzdE6yqc9w=
X-Google-Smtp-Source: AA6agR51MlTVkECMOkCcfSBY/eKRePWM2JMEl8QhB9bsKxUbI9ainFG0dFWvrfWTo1X0qGZRso32ow==
X-Received: by 2002:a05:6402:451:b0:446:7349:f9e8 with SMTP id p17-20020a056402045100b004467349f9e8mr3043070edw.180.1661019405215;
        Sat, 20 Aug 2022 11:16:45 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb77.dynamic.kabel-deutschland.de. [95.90.187.119])
        by smtp.gmail.com with ESMTPSA id g2-20020a17090604c200b0072af890f52dsm3887833eja.88.2022.08.20.11.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Aug 2022 11:16:44 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 13/19] staging: r8188eu: move struct pkt_file to rtw_xmit.h
Date: Sat, 20 Aug 2022 20:16:17 +0200
Message-Id: <20220820181623.12497-14-straube.linux@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220820181623.12497-1-straube.linux@gmail.com>
References: <20220820181623.12497-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The code that uses struct pkt_file has been moved to rtw_xmit.c.
Move the structure definition to rtw_xmit.h.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/include/rtw_xmit.h   | 9 +++++++++
 drivers/staging/r8188eu/include/xmit_osdep.h | 9 ---------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/r8188eu/include/rtw_xmit.h b/drivers/staging/r8188eu/include/rtw_xmit.h
index 034a9f8f51c9..0e9471fb19e4 100644
--- a/drivers/staging/r8188eu/include/rtw_xmit.h
+++ b/drivers/staging/r8188eu/include/rtw_xmit.h
@@ -304,6 +304,15 @@ struct	xmit_priv {
 	struct submit_ctx ack_tx_ops;
 };
 
+struct pkt_file {
+	struct sk_buff *pkt;
+	size_t pkt_len;	 /* the remainder length of the open_file */
+	unsigned char *cur_buffer;
+	u8 *buf_start;
+	u8 *cur_addr;
+	size_t buf_len;
+};
+
 struct xmit_buf *rtw_alloc_xmitbuf_ext(struct xmit_priv *pxmitpriv);
 s32 rtw_free_xmitbuf_ext(struct xmit_priv *pxmitpriv,
 			 struct xmit_buf *pxmitbuf);
diff --git a/drivers/staging/r8188eu/include/xmit_osdep.h b/drivers/staging/r8188eu/include/xmit_osdep.h
index bcecf0bb2b18..612cdab52a9f 100644
--- a/drivers/staging/r8188eu/include/xmit_osdep.h
+++ b/drivers/staging/r8188eu/include/xmit_osdep.h
@@ -7,15 +7,6 @@
 #include "osdep_service.h"
 #include "drv_types.h"
 
-struct pkt_file {
-	struct sk_buff *pkt;
-	size_t pkt_len;	 /* the remainder length of the open_file */
-	unsigned char *cur_buffer;
-	u8 *buf_start;
-	u8 *cur_addr;
-	size_t buf_len;
-};
-
 extern int rtw_ht_enable;
 extern int rtw_cbw40_enable;
 extern int rtw_ampdu_enable;/* for enable tx_ampdu */
-- 
2.37.2

