Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32B22CA1
	for <linux-staging@lists.linux.dev>; Sat, 29 Jan 2022 16:31:44 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id c9so8828749plg.11
        for <linux-staging@lists.linux.dev>; Sat, 29 Jan 2022 08:31:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=31GtAtozxIAbYu2fcxuIJ0ssFhQMM45afowSfajVZ7k=;
        b=dfS2BCG1tJ1YlJ8hD0HkFk8j+DSZ4faQbbQrySqr+fx9awuWxbsRaR9+AoIOQyj/oB
         C2Py6wKfw0AIDfbzJUp7DFxSEgiFhZ5LF798yGGVmJ6EEXO9p81yqgyllc7wFOkQ8+ay
         ETwn3V3GopEg4peLiZ11vbOWtiIlqAg2xb73euxynkqHeUqKdIneFymqPS3H6/1ULp85
         NkNMCOMxJGs8JZdFuMfzeAd+VyiqzqIGg+WlrqhtIpqETDAhdd+SYQmHjYErLKABARIe
         bvpABVN/8a/l/yQwtt+cRtXedv8sfNLGWqdZqfLlCczpqVWNu+jbgMtjp7aAG0wfo4HG
         TAaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=31GtAtozxIAbYu2fcxuIJ0ssFhQMM45afowSfajVZ7k=;
        b=2E7j85O5qVfF/IEAgO3ISr+0bYZ/ktubo1CINYSExeDM47zO0JPR/RtHpeH3g7p7R3
         5vz0b8K18SmyM/s8tnyjDK3RUnq14XXAl1ARht+VtfWUwo20raJNNS65rV2k2+6/QHXO
         QX3jkq2NlRCQHofjyjSB6hDFFz3xkCk2VknXe9GLweLHt7pIK+NI6GMHeMMyB+Wmg1VH
         qqFrz2DtBbt0MNTTwRdYehfJ1Wco451JXMpMviWZMuXfMh51pU4IuZcmR0pR1JgD0lVE
         xxuMeF2VsWWxKH16PLSt98n+yiAVCOl2+/UmIqiqezl8yeRXliltBzE4qn2RCqyrQS60
         hggw==
X-Gm-Message-State: AOAM533/EPvVtDalGnB5Xf57GXw77Zr9VyJFBVznAFJXXDu9gz3BqEdE
	rKudrT+p03lG2g+l/1fuF4w=
X-Google-Smtp-Source: ABdhPJxtO8DiEZcoOTpV5REIv5alM0Q6jY679YqiEc/Mqly/lKm1FbLOkrvIO5JJSdKwBsGTDNk9JQ==
X-Received: by 2002:a17:90b:1912:: with SMTP id mp18mr25454989pjb.152.1643473904583;
        Sat, 29 Jan 2022 08:31:44 -0800 (PST)
Received: from localhost.localdomain ([171.78.146.184])
        by smtp.googlemail.com with ESMTPSA id q13sm1893528pfj.44.2022.01.29.08.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jan 2022 08:31:44 -0800 (PST)
From: Abdun Nihaal <abdun.nihaal@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Abdun Nihaal <abdun.nihaal@gmail.com>,
	Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	straube.linux@gmail.com,
	martin@kaiser.cx,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 09/23] staging: r8188eu: propagate error code in rtw_p2p_get2
Date: Sat, 29 Jan 2022 21:58:01 +0530
Message-Id: <818aad89738b66942bb66568081f1953a9494078.1643466748.git.abdun.nihaal@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1643466748.git.abdun.nihaal@gmail.com>
References: <cover.1643466748.git.abdun.nihaal@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rtw_p2p_get2 calls functions that can fail with -EFAULT.
Return the error code from the called functions.

Signed-off-by: Abdun Nihaal <abdun.nihaal@gmail.com>
---
- Newly added in V4

 drivers/staging/r8188eu/os_dep/ioctl_linux.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/r8188eu/os_dep/ioctl_linux.c b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
index 35f7ba66a7cf..99c7f9369d2a 100644
--- a/drivers/staging/r8188eu/os_dep/ioctl_linux.c
+++ b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
@@ -3452,19 +3452,19 @@ static int rtw_p2p_get2(struct net_device *dev,
 	DBG_88E("[%s] extra = %s\n", __func__, (char *)wrqu->data.pointer);
 	if (!memcmp(extra, "wpsCM =", 6)) {
 		wrqu->data.length -= 6;
-		rtw_p2p_get_wps_configmethod(dev, info, wrqu,  &extra[6]);
+		ret = rtw_p2p_get_wps_configmethod(dev, info, wrqu,  &extra[6]);
 	} else if (!memcmp(extra, "devN =", 5)) {
 		wrqu->data.length -= 5;
-		rtw_p2p_get_device_name(dev, info, wrqu, &extra[5]);
+		ret = rtw_p2p_get_device_name(dev, info, wrqu, &extra[5]);
 	} else if (!memcmp(extra, "dev_type =", 9)) {
 		wrqu->data.length -= 9;
-		rtw_p2p_get_device_type(dev, info, wrqu, &extra[9]);
+		ret = rtw_p2p_get_device_type(dev, info, wrqu, &extra[9]);
 	} else if (!memcmp(extra, "go_devadd =", 10)) {
 		wrqu->data.length -= 10;
-		rtw_p2p_get_go_device_address(dev, info, wrqu, &extra[10]);
+		ret = rtw_p2p_get_go_device_address(dev, info, wrqu, &extra[10]);
 	} else if (!memcmp(extra, "InvProc =", 8)) {
 		wrqu->data.length -= 8;
-		rtw_p2p_get_invitation_procedure(dev, info, wrqu, &extra[8]);
+		ret = rtw_p2p_get_invitation_procedure(dev, info, wrqu, &extra[8]);
 	}
 
 	return ret;
-- 
2.34.1

