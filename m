Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0DC6D00
	for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 14:20:50 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id l4so12997100ejc.10
        for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 07:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/Lkqq2V46NZQ/iOiuGJd2meNdKo8+AHiDVO59b9jNUY=;
        b=QmImsZ0Dpg40Z5YyyMPHvT21jqkIK/2JLMXawV0LcpKyGoE7u/jiQMpnVvAMsqmUgs
         ndExBtdxcI16L7AeKRJA3wg7k/zOwFN/W3LsT/DrO7eMiQ50mXrH0XxSH2At4uPRzp3J
         PXY6hoR+vLY6h+Ewp4FQ3x0mC08UD/s8HYIBsjExA+LjSS2lXgtxwAiNDxdsP6as6juU
         rF5pbkrHlFL1hFngEqvXlM4FHkP6s8bJbuOqpDTt3zt7uXbBHn73+9AVpkMfBslYBZAM
         Afj94scUwSAMuP5RAGK8yThFgPpmQMNINzfAml2sTxMeKlTrsKq+xC5Ul3ROYZZp+Qfp
         fnIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/Lkqq2V46NZQ/iOiuGJd2meNdKo8+AHiDVO59b9jNUY=;
        b=bHGFfNivRo7V63LLOhgWGYHxxFOCu5KWAtg59xeIaVg4u0PP5ndFR9a8cg0FSxW35y
         nYP4MYqnhvD2BLtjQwGjHuw11fSLXswAHR+4Z2/55yHK1B4z7uoqAX8wRT9vIbUz86ks
         n7G9F5uigP89ZGz60oHT+Q6lNkE4JwxRSlcIVs9ALplbVkqbpJJ+twhAf/MQBVM9MbEW
         XVmu0+ptTz7X0wXdIaRSSUbyDUf39bcfvt8KKq9g+GCyeV/JeXjs48V2GoDb4oltj73R
         9ACxEPccOh0rApootVvvG0YcBqVQ3+ZydbS16Q1DCzqEI2IVbTtoPfdnODm4sqtznpFL
         zUbg==
X-Gm-Message-State: AOAM532x+Bv+cwf3H4nuHo/m55APizzhQon75sEQkZiSP+Canbi5H/o4
	81m3rSQcKOAzHa0JsKb3LeMVcONd4qjIGQ==
X-Google-Smtp-Source: ABdhPJyL06EkeJPFuy3JVuCqETeaHRiFIl6/6SgwWTNB5NRbwiMEExv4/fJb39fnV8bixE44WRELYg==
X-Received: by 2002:a17:906:d9ca:: with SMTP id qk10mr19504519ejb.436.1618064448856;
        Sat, 10 Apr 2021 07:20:48 -0700 (PDT)
Received: from agape ([5.171.81.28])
        by smtp.gmail.com with ESMTPSA id dj8sm3170248edb.86.2021.04.10.07.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Apr 2021 07:20:48 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 05/25] staging: rtl8723bs: put spaces around operators
Date: Sat, 10 Apr 2021 16:20:18 +0200
Message-Id: <35c6c5efa2661c6fd9d40c3a681eb8470c5015e6.1618064274.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1618064274.git.fabioaiuto83@gmail.com>
References: <cover.1618064274.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix following post-commit hook checkpatch issue:

CHECK: spaces preferred around that '+' (ctx:VxV)
89: FILE: drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:2431:
+	rtw_get_wps_ie(pbuf+_FIXED_IE_LENGTH_, ;
 	                   ^
len-_FIXED_IE_LENGTH_, NULL, &wps_ielen)

CHECK: spaces preferred around that '-' (ctx:VxV)
89: FILE: drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:2431:
+	rtw_get_wps_ie(pbuf+_FIXED_IE_LENGTH_, len-_FIXED_IE_LENGTH_,
	                                          ^
NULL, &wps_ielen);

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 6d5109aa4b69..80d9805eaa38 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -2428,7 +2428,7 @@ static int rtw_add_beacon(struct adapter *adapter, const u8 *head, size_t head_l
 	len = head_len+tail_len-24;
 
 	/* check wps ie if inclued */
-	rtw_get_wps_ie(pbuf+_FIXED_IE_LENGTH_, len-_FIXED_IE_LENGTH_, NULL, &wps_ielen);
+	rtw_get_wps_ie(pbuf + _FIXED_IE_LENGTH_, len - _FIXED_IE_LENGTH_, NULL, &wps_ielen);
 
 	/* pbss_network->IEs will not include p2p_ie, wfd ie */
 	rtw_ies_remove_ie(pbuf, &len, _BEACON_IE_OFFSET_, WLAN_EID_VENDOR_SPECIFIC, P2P_OUI, 4);
-- 
2.20.1

