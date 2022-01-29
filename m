Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECEFC2CA1
	for <linux-staging@lists.linux.dev>; Sat, 29 Jan 2022 16:31:40 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id d18so8887162plg.2
        for <linux-staging@lists.linux.dev>; Sat, 29 Jan 2022 08:31:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=59y5lHN2gs000ZG3867tBGbxqegY+PjUJ9DhuQ1m6Jw=;
        b=aYzc9UvQSShqFwuvEjSRpqL3kkzYaXWL+Ree2TKSdMdJNBPEszjHEr1ooczhTLiViA
         9AL3SFb0m71oDA1HVJnS1CsabRvU52TE6q8DjmFv1IBTtoY0enJU28aa4O/HN/++lbCd
         Bcto+8k0kGA+p4p1ID9sEVbu9FfMCD5fWVTG7L/+Z319LYewY7wGeDjO7sHDV86FfwPy
         iTXD0Ailil1nr/wPzSH5eazOxOPBoqIvC1ux2wBbkT3v0prFchv2dLLwEIdyASqjeUX4
         6fCwxB6vltJ1qvGe3CTDCP7ylmvPeUcztnV7E8VFUO3DB19d7hj7xAQpQmdD/lPFWLsq
         KOeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=59y5lHN2gs000ZG3867tBGbxqegY+PjUJ9DhuQ1m6Jw=;
        b=vWSnxjLdK37tLowYwyueDbHRryIvj0bW57biaqEDaRbcnYi/cp4zwTnMAzwMhTvVUL
         5/6oI5YClIx6H9/zjF08VmgCcUwCbF0sazIBpSRTrGmXqn1diWXvjq8Q4jKZyhUn7uXF
         0qY+A+b5f3/BKWFh11lF7apbK9ck9jfBPVFXKFMEAGGU+S3PgNxr1UiMpDT4MEiyNQmn
         gECZDs+s1JmlWU35unL6G7a8cqlvzKf+IqDO3gam6xQdjyX1PNLK5G/6CnPSdYdPqhF/
         01eiRFDoFoRzgwSi57iihX+SF0WjF1eSe1u8/V3uW5FFrEt3T9S9bhsOe2H1S7A6Z2SG
         UgwA==
X-Gm-Message-State: AOAM532bPR47mzj6fkIDJBgCAlsUdundSl6uq+pDsPQ1RHF+rKdWY2vU
	opVM9viM6UMfTlvpEfHjK3g=
X-Google-Smtp-Source: ABdhPJzlcsQcJTyZjb2jsvBoGjUiiqasO3bAH1sR2Gsy8SPZdD9o91H91k1sgJMO3O0MOfjcheJt4Q==
X-Received: by 2002:a17:90b:4d84:: with SMTP id oj4mr15684253pjb.192.1643473900489;
        Sat, 29 Jan 2022 08:31:40 -0800 (PST)
Received: from localhost.localdomain ([171.78.146.184])
        by smtp.googlemail.com with ESMTPSA id q13sm1893528pfj.44.2022.01.29.08.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jan 2022 08:31:39 -0800 (PST)
From: Abdun Nihaal <abdun.nihaal@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Abdun Nihaal <abdun.nihaal@gmail.com>,
	Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	straube.linux@gmail.com,
	martin@kaiser.cx,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 08/23] staging: r8188eu: remove unneeded variable in rtw_p2p_get_invitation_procedure
Date: Sat, 29 Jan 2022 21:58:00 +0530
Message-Id: <ccec1f682fbc623381519610284530f940122d0e.1643466748.git.abdun.nihaal@gmail.com>
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

Remove unneeded return variable that is initialized to 0 and not
assigned after.

Found using Coccinelle
Signed-off-by: Abdun Nihaal <abdun.nihaal@gmail.com>
---
 drivers/staging/r8188eu/os_dep/ioctl_linux.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/os_dep/ioctl_linux.c b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
index 33fe8e944df4..35f7ba66a7cf 100644
--- a/drivers/staging/r8188eu/os_dep/ioctl_linux.c
+++ b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
@@ -2909,7 +2909,6 @@ static int rtw_p2p_get_invitation_procedure(struct net_device *dev,
 			       struct iw_request_info *info,
 			       union iwreq_data *wrqu, char *extra)
 {
-	int ret = 0;
 	struct adapter *padapter = (struct adapter *)rtw_netdev_priv(dev);
 	u8 peerMAC[ETH_ALEN] = {0x00};
 	int jj, kk;
@@ -2978,7 +2977,7 @@ static int rtw_p2p_get_invitation_procedure(struct net_device *dev,
 	}
 	if (copy_to_user(wrqu->data.pointer, inv_proc_str, 8 + 17))
 		return -EFAULT;
-	return ret;
+	return 0;
 }
 
 static int rtw_p2p_connect(struct net_device *dev,
-- 
2.34.1

