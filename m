Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 060BC7B;
	Thu, 20 Oct 2022 10:56:36 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id g1so32852742lfu.12;
        Thu, 20 Oct 2022 03:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tEmNh4R0QJOPxLimqEC/Xs1kq2UBfm/vuBxLtj1a2rk=;
        b=FzDOPEbcl6MLFkqFsxogyoko0ePdQin24WYBfDNjGcQIJ8Y+uGJKaxHeCIbKQ8epTL
         is3Kr8df9p/UKPWbCQIpA2JJCZGs5owrfOmU0zXIlqoSQvwxWtcK49S6ghZU/BETxSgE
         xK9i3Hmf2flYAtoy9JkR3o0mTTYiK30gONRIV1FaUhNeS9Jt2ZD3ErCbww23P52W2ZwJ
         VysRHseEJaGUmdOszO+C3G6lK0dLYerwbH3ara1+TNqIcOYdT8oxnDQeqyGMJM7sCqvS
         pvSPEQlMzqIxu2usXj4Z4iyPrRnC0tVuuwStUK3EzM+zZwco3NllNe4EOQs+Yl+YnwII
         S6/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tEmNh4R0QJOPxLimqEC/Xs1kq2UBfm/vuBxLtj1a2rk=;
        b=Zb1HmP2fThSBAHyb954Oaqd8Yfrv+kL6be5vhnvhDr3hMKlS+dJMO1iWWEQlU5+UO0
         PN34yVVyjMJANYEwYmguInPF3pZ2OJ7M5+mQNwR2P+KrLemqu9rDH50mENdVPWVLF364
         ljRu+cm9oxelKW5teeiex7LHlniQrFFN1K/D7eCpCfjnhn5IYTc8Zov75eMO2yXDo/zn
         RvJFIrkr7nlrlzn4MDrExtMXLLayhyl0+VBPIsva/uc3rqAZDmU4CtEkDlmsJepp3jit
         f97iVeehNYYtfmVrCsbrSbFRIhbehwlq3SYHX8Fra8N4DefIiWa/18hY/tLEK7K0VFv3
         V8+w==
X-Gm-Message-State: ACrzQf3nF5WbYq+VVvmkl7AGxnzyjabZXswkDp3lhZKqN8hZdLldmWMi
	4vxdtfWCySdpLzXqYIs54r7NASkHbzpnZMye
X-Google-Smtp-Source: AMsMyM4NjRYVbyF9c0UBDUWKKZYrkmDQVLMRNszxHlNWlpezD6//ODWPGs5a8o9KnZIyZclvbCcZBA==
X-Received: by 2002:ac2:47fc:0:b0:4a2:4e9a:64f5 with SMTP id b28-20020ac247fc000000b004a24e9a64f5mr4803257lfp.434.1666263394979;
        Thu, 20 Oct 2022 03:56:34 -0700 (PDT)
Received: from elroy-temp-vm ([20.240.130.248])
        by smtp.gmail.com with ESMTPSA id bf38-20020a2eaa26000000b0026fdecfa6ebsm2447081ljb.15.2022.10.20.03.56.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Oct 2022 03:56:34 -0700 (PDT)
Date: Thu, 20 Oct 2022 10:56:33 +0000
From: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
To: outreachy@lists.linux.dev, greg@kroah.com, forest@alittletooquiet.net,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v3] staging: vt6655: Fix Lines should not end with a '('
Message-ID: <Y1EpYbkrau17uhDI@elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Code style warnings reported by checkpatch.
Improve the layout of a function header:
Put the first parameter immediately after the '(' and align the other
parameters underneath it.

Signed-off-by: Tanjuate Brunostar <tanjubrunostar0@gmail.com>

---
v2: put static and void on the same line and adjusted the indentation as
suggested by Greg KH
---
 drivers/staging/vt6655/rxtx.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
index 5bdb5176772c..d987f7dff02a 100644
--- a/drivers/staging/vt6655/rxtx.c
+++ b/drivers/staging/vt6655/rxtx.c
@@ -85,10 +85,8 @@ static const unsigned short wFB_Opt1[2][5] = {
 #define DATADUR_A_F1    13
 
 /*---------------------  Static Functions  --------------------------*/
-static
-void
-s_vFillRTSHead(
-	struct vnt_private *pDevice,
+static void
+s_vFillRTSHead(struct vnt_private *pDevice,
 	unsigned char byPktType,
 	void *pvRTS,
 	unsigned int	cbFrameLength,
@@ -96,13 +94,10 @@ s_vFillRTSHead(
 	bool bDisCRC,
 	struct ieee80211_hdr *hdr,
 	unsigned short wCurrentRate,
-	unsigned char byFBOption
-);
+	unsigned char byFBOption);
 
-static
-void
-s_vGenerateTxParameter(
-	struct vnt_private *pDevice,
+static void
+s_vGenerateTxParameter(struct vnt_private *pDevice,
 	unsigned char byPktType,
 	struct vnt_tx_fifo_head *,
 	void *pvRrvTime,
@@ -112,8 +107,7 @@ s_vGenerateTxParameter(
 	bool bNeedACK,
 	unsigned int	uDMAIdx,
 	void *psEthHeader,
-	unsigned short wCurrentRate
-);
+	unsigned short wCurrentRate);
 
 static unsigned int
 s_cbFillTxBufHead(struct vnt_private *pDevice, unsigned char byPktType,
-- 
2.34.1

