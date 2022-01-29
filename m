Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF412CA1
	for <linux-staging@lists.linux.dev>; Sat, 29 Jan 2022 16:32:27 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id z131so8026429pgz.12
        for <linux-staging@lists.linux.dev>; Sat, 29 Jan 2022 08:32:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BnoXAnXc7/IIDarFMwEmp9tL1k9KPEgWxwtn8l7GULc=;
        b=Zsa/gs4ZU47pZFFCHFUEFfOWyOLuFJ1RiRoMESPYwpbEzhHcyzYSELyD4qM1Nq9t5K
         K7NBPzURaI6f9zk4s98j07QJ24qwCSKwbHtjwuiG8mY7EhhL/hxeCe/lhSN0sQ/CYAaL
         ZFQf7kgWh6KE/42Wgq0BGfpQYCFqe543B8tP9cqaBbzi7tdWAHBkUVdqDLc6lucH9gVb
         55ciqv/u2GnqPhBvVU5ipGf6o2NykKk/m+lpOLzlnVizcgBQvUXPRdyZYQmxnsEPBNY9
         UtnbBHHIDUfkkTTFc6AAfBnRHcDh/ED4M24HigLcxB0yHB5yUpE5/AVbwUHp0vXd586b
         gbqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BnoXAnXc7/IIDarFMwEmp9tL1k9KPEgWxwtn8l7GULc=;
        b=ed6bFO8YEDEEA/x89L/Gwo/cfrxCWzj3plajT+usyyjHTGHCQIDkZwB/NFeAAL4KQy
         Y1ifbivbqDcIqKFRQIv+H/3ep6dTkf6fgEYnyAC8X5LfDBYIZoQrR7fzR6DL4MSyQwXF
         l1kAPYNu3CeR7zqlAiRNULrW3w9qmL4luEJPyr+k8LnhycLPyPpN+DiZYneRbHUql5Ee
         0fPgdmSj1R0nYoBgkJIWRMeY2KqUsF0em+vN4xPULM5RFdPw1kbuNtoIyMjqseHLyz0g
         XgO1EARfcOcOT5W016BlxVx2ItID/YLLSr+4z4/fgcYsXSiHlVerqO3IbuQ/XmrcMDIs
         QaMg==
X-Gm-Message-State: AOAM530+4p7vFfzwVozz3TMENIZPfnQPeoCrnL2yH8QbjjBNUx3uFHyX
	UB3dQyNHGwgzk5gPKdXLnkw=
X-Google-Smtp-Source: ABdhPJzRcGKjBKM430X6B5REQ9rLilY5C1qwlhWgHKtdvey+khbdxfzmo+T1DQ5zuZfN5OqiqiiNgg==
X-Received: by 2002:a65:51cd:: with SMTP id i13mr10666141pgq.412.1643473947056;
        Sat, 29 Jan 2022 08:32:27 -0800 (PST)
Received: from localhost.localdomain ([171.78.146.184])
        by smtp.googlemail.com with ESMTPSA id q13sm1893528pfj.44.2022.01.29.08.32.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jan 2022 08:32:26 -0800 (PST)
From: Abdun Nihaal <abdun.nihaal@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Abdun Nihaal <abdun.nihaal@gmail.com>,
	Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	straube.linux@gmail.com,
	martin@kaiser.cx,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 20/23] staging: r8188eu: convert rtw_p2p_invite_req to return void
Date: Sat, 29 Jan 2022 21:58:12 +0530
Message-Id: <059a21d40a5c6cbe621ca969f9d32ea89bc9a977.1643466748.git.abdun.nihaal@gmail.com>
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

rtw_p2p_invite_req always returns 0 and it's return value is not used.
Convert it to return void.

Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Abdun Nihaal <abdun.nihaal@gmail.com>
---
 drivers/staging/r8188eu/os_dep/ioctl_linux.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/r8188eu/os_dep/ioctl_linux.c b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
index f533f709ead5..6375b3776168 100644
--- a/drivers/staging/r8188eu/os_dep/ioctl_linux.c
+++ b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
@@ -3037,11 +3037,10 @@ static int rtw_p2p_connect(struct net_device *dev,
 	return ret;
 }
 
-static int rtw_p2p_invite_req(struct net_device *dev,
-			      struct iw_request_info *info,
-			      union iwreq_data *wrqu, char *extra)
+static void rtw_p2p_invite_req(struct net_device *dev,
+			       struct iw_request_info *info,
+			       union iwreq_data *wrqu, char *extra)
 {
-	int ret = 0;
 	struct adapter *padapter = (struct adapter *)rtw_netdev_priv(dev);
 	struct wifidirect_info *pwdinfo = &padapter->wdinfo;
 	int jj, kk;
@@ -3065,12 +3064,12 @@ static int rtw_p2p_invite_req(struct net_device *dev,
 
 	if (wrqu->data.length <=  37) {
 		DBG_88E("[%s] Wrong format!\n", __func__);
-		return ret;
+		return;
 	}
 
 	if (rtw_p2p_chk_state(pwdinfo, P2P_STATE_NONE)) {
 		DBG_88E("[%s] WiFi Direct is disable!\n", __func__);
-		return ret;
+		return;
 	} else {
 		/*	Reset the content of struct tx_invite_req_info */
 		pinvite_req_info->benable = false;
@@ -3143,7 +3142,6 @@ static int rtw_p2p_invite_req(struct net_device *dev,
 	} else {
 		DBG_88E("[%s] NOT Found in the Scanning Queue!\n", __func__);
 	}
-	return ret;
 }
 
 static int rtw_p2p_set_persistent(struct net_device *dev,
-- 
2.34.1

