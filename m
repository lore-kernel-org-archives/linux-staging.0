Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com [209.85.210.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E8E6163;
	Thu,  7 Apr 2022 00:09:53 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id 88-20020a9d0ee1000000b005d0ae4e126fso2832714otj.5;
        Wed, 06 Apr 2022 17:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XVeFHIc1i7/STUyOqY2BjiqMfxqrpI5r2pW0fHpiZrg=;
        b=ju2OgTKNguSXVies5Fr0Bpbt5cr6vjY31Htu9eJLAfPRmr4Bl4WwFpPeeSdZG11zSz
         0jQYeT3ojk8AoLZKSUv0WYwxxEM+aP4NaETmYs6W0eWoa3u7XCXafWtT9lij51TtMI5C
         d/ZOWrw0ddAvLlYvqq7URXMp5qo6lgjvl5XLLoU0Qi8SjLI/UxCOe4LwbvFIKHKFn5TC
         xBZ7dKTG1+R4LUC9HkppTPO8TSbfuFDgoKFliDI1gxRDrK4/VqCsWg2Hot4vgyFDWC1r
         oZD+reRwRQVpeUQvRr9+xvX2IJqVgwfxDZZn78xWhBTKx5eKIe253yMV24axUcSzrruZ
         HBPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XVeFHIc1i7/STUyOqY2BjiqMfxqrpI5r2pW0fHpiZrg=;
        b=4FMBR3fsYLVni4MwFRxUYqnjXa6GwU5SH8oW1egfXdu7/1KpHgZd7KwBPkzrWq1tmS
         ievtsY1CDJiI9u3Sw4eRbIXNSjOqJnRCqVx4Ll1ES5Vepy933CJqiHZI1hF5OF3ZITmU
         0rvU2taww995yMB/wFD+ppJlUtV4ZTjv2w+zsF1TEWdHEppdZhXB2Dnqr4N+7bfGQPKw
         bZf3thJd85KezONiKHoK4RB2tI0HvEr1Qp7NpwSzjeFa+qNUE/Ahm5AI0M80YIShXYCT
         oUXEXcgjPIFgU1TXOTTr0HQscym5ObLj3erG9vrc2Vxkj+GT6IdIqlq9CjHtIESJgOvG
         C+pg==
X-Gm-Message-State: AOAM531xEyx/5JJZaojCKXOyE1fNTKO8HO/SxOiViH+RGyZly3NXD6Gy
	SUs38atMT4/SwoQP49xrpTY=
X-Google-Smtp-Source: ABdhPJwmTWBL+ymtBkt//FaRniw79brAz5nbLTAH0A+7eOqrMU/Og6M6W2L1T695eo1odVpp4VgYDA==
X-Received: by 2002:a9d:610e:0:b0:5c9:373e:5819 with SMTP id i14-20020a9d610e000000b005c9373e5819mr3831455otj.348.1649290191153;
        Wed, 06 Apr 2022 17:09:51 -0700 (PDT)
Received: from bertie (072-190-140-117.res.spectrum.com. [72.190.140.117])
        by smtp.gmail.com with ESMTPSA id p11-20020acabf0b000000b002ef93581a46sm6923348oif.2.2022.04.06.17.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Apr 2022 17:09:50 -0700 (PDT)
From: Rebecca Mckeever <remckee0@gmail.com>
To: outreachy@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rebecca Mckeever <remckee0@gmail.com>
Subject: [PATCH 1/2] staging: rtl8192u: use max macro instead of ternary operator
Date: Wed,  6 Apr 2022 19:09:43 -0500
Message-Id: <2513b1520d533c9f487903fc2c97f4637fe5f6da.1649288226.git.remckee0@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1649288226.git.remckee0@gmail.com>
References: <cover.1649288226.git.remckee0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace ternary operator with max macro to increase readability
and conform to Linux kernel coding style.
Found with minmax coccinelle script.

Signed-off-by: Rebecca Mckeever <remckee0@gmail.com>
---
 drivers/staging/rtl8192u/ieee80211/ieee80211_wx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192u/ieee80211/ieee80211_wx.c b/drivers/staging/rtl8192u/ieee80211/ieee80211_wx.c
index 78cc8f357bbc..a10c1303695b 100644
--- a/drivers/staging/rtl8192u/ieee80211/ieee80211_wx.c
+++ b/drivers/staging/rtl8192u/ieee80211/ieee80211_wx.c
@@ -470,7 +470,7 @@ int ieee80211_wx_get_encode(struct ieee80211_device *ieee,
 		return 0;
 	}
 	len = crypt->ops->get_key(keybuf, SCM_KEY_LEN, NULL, crypt->priv);
-	erq->length = (len >= 0 ? len : 0);
+	erq->length = max(len, 0);
 
 	erq->flags |= IW_ENCODE_ENABLED;
 
-- 
2.32.0

