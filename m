Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819882FB3
	for <linux-staging@lists.linux.dev>; Wed, 23 Jun 2021 23:49:14 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id h10so2390006qvz.2
        for <linux-staging@lists.linux.dev>; Wed, 23 Jun 2021 16:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/Hh5lYAWTUrX0DOd6hIZFo3zp9oaX/gLXEInfNqNWaA=;
        b=M4UsGJxDIE8NsJaXXlTn4brOvSs/PXLqW4EdMRz/b14wMv7WeR5Uc1y/DQKlb8/BLf
         k5QeOIFmXlrpzPQXei508I6b7VPwOGrnA1odYurAmp8Tjq9v1t0bwMdCeufsYbmLfRGR
         PIzPT6rLtmG5pzXAQa/61DxDxxOfb4Qmy0SF3w7PNMOs/SpJ45hbqDVtWf1Tw0z7lj9g
         CENZKPhHrLAGhcUJ/fQh5R4oOSS9JjZ+GrGzt8ATMA4DAwDWGgkGP+E+ASVJTMScHED2
         yY0ZmAuZ4X9gd8znB15l8DCawBMzaUH7yQJ8vSoSL7LXGfnh2J4/pjr6SqGbdFQoDqNo
         gnAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/Hh5lYAWTUrX0DOd6hIZFo3zp9oaX/gLXEInfNqNWaA=;
        b=R9DUIer7dARjDs8p1vlrK0jBdx0q27wm0KevqCqNqKBPKCp8Gz7kWimztLLtzZ1e7Q
         04Gzd42xwtnbLROVFneW8fRJf7yH9BmoAexwUo4eeqb1CbNF9efIfR6ie8PZ2q3HuyAd
         VIpq34zz2Pi+TTcB7m+1z+YmKrXt8vC7lDJeSScucray0SnGAitLI4KXftsVlsNQ2lFk
         DvdSRhHdvf+DsNk+gqMEcDrehDODKpSdHSCq7rkeotrLneupaG5oVsckdJmnfFCCHk37
         ArS/baof0XFDduzbKnrjc4327jpw3JVV5GNSfX+QqB1Zk4big/4Xa/Q/XLbDX6puMaNs
         fisg==
X-Gm-Message-State: AOAM531s8IJpYvajf9KXAOXt9ku1XjJoLCfWLQ6pfTNaHj0JOvUiIO47
	nKrQv8G719CubNOwfTsKnj6AWQ==
X-Google-Smtp-Source: ABdhPJwXB5y+OGjLmBrll3ANFXOQwCRk0/OKkcIV+UJlpUb9RZYh8OrfDd50wH4euiRWOGeXm395RA==
X-Received: by 2002:a05:6214:b0d:: with SMTP id u13mr2167932qvj.55.1624492153775;
        Wed, 23 Jun 2021 16:49:13 -0700 (PDT)
Received: from kerneldevvm.. (5.6.a.8.a.a.b.f.c.9.4.c.a.9.a.a.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0:aa9a:c49c:fbaa:8a65])
        by smtp.gmail.com with ESMTPSA id w2sm992387qto.50.2021.06.23.16.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jun 2021 16:49:13 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	dan.carpenter@oracle.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 5/9] staging: rtl8188eu: remove all DBG_88E_LEVEL calls from core/rtw_xmit.c
Date: Thu, 24 Jun 2021 00:48:58 +0100
Message-Id: <20210623234902.7411-6-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210623234902.7411-1-phil@philpotter.co.uk>
References: <20210623234902.7411-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove all DBG_88E_LEVEL calls from core/rtw_xmit.c as this macro is
unnecessary, and these calls are dubious in terms of necessity.
Removing all calls will ultimately allow the removal of the macro
itself.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/rtl8188eu/core/rtw_xmit.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8188eu/core/rtw_xmit.c b/drivers/staging/rtl8188eu/core/rtw_xmit.c
index 07c2171a42d0..2a51ea26e0ff 100644
--- a/drivers/staging/rtl8188eu/core/rtw_xmit.c
+++ b/drivers/staging/rtl8188eu/core/rtw_xmit.c
@@ -448,8 +448,6 @@ static s32 update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct p
 				}
 			}
 		}
-	} else if (pattrib->ether_type == ETH_P_PAE) {
-		DBG_88E_LEVEL(_drv_info_, "send eapol packet\n");
 	}
 
 	if ((pattrib->ether_type == ETH_P_PAE) || (pattrib->dhcp_pkt == 1))
-- 
2.31.1

