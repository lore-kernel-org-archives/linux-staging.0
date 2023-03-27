Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF4379CE
	for <linux-staging@lists.linux.dev>; Mon, 27 Mar 2023 21:03:14 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id x3so41496542edb.10
        for <linux-staging@lists.linux.dev>; Mon, 27 Mar 2023 14:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679950994; x=1682542994;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MT5t4boQulRjetg/3fnrhsk3Dnqce+x2uebcAL0xAiQ=;
        b=DjL8IAwBgRhT+yLu9O+NFfgVv9qXEMHhSzS0s08MvjmM1H0XRfsEtkhLVa4gbu2YEf
         D+XEvSC4B8htimvnk/N1uYCV5uLfnmPDTtKtjDjW+Vh2HWi+9i1LLaWefvWZ8E2Ng4SA
         lviD35xdItNHgDDRMsVqfSxXsDqUxuN9TCrKfCr8xleY0WPT7G15KY0+r66lWNVqS7sx
         NjxYQYch1yZKW26uSuDzURokkMyS1YDz1r+tNosW5LjwiWGwea9YQO6+iZi8cN8lNoN0
         9ULmaOXW/+vEcud+uMzB/LkmF++PyoqNXPmMhliX6LS2DNID/3is4YdIaqLfwvQYjfnQ
         7CWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679950994; x=1682542994;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MT5t4boQulRjetg/3fnrhsk3Dnqce+x2uebcAL0xAiQ=;
        b=W5tfKh+nQRT/XFBgRAxG1PmOUTCEjqIH6e5g2BUNF/mPu16mYu5sqD0a9FtEiOHQ9M
         739ARpAPNxhE0aPk0W1bS6vev+XfJfn2f4+HhVDapzZl+38XaTvsVE7VnPLFzLuNEcKB
         vwX69WKeH1viRUkMBKuM20nzcHrT65lkf8lQ9p4cpR/sXL/FKutviavyAitWNbmrFSNA
         mGdv8kNL2EkebZgej0J5nnaYpo+Qd1G27dJF2lTmbdi7ZrF8aVoOPSdl3Wzm1zaikSOv
         xQQUUetV1QnfsBWcwcnlvDH+EFZ3MRivTAGFdQagYTPlAdLZ7vu0/1JNktr0jPt8Gfi6
         2Upg==
X-Gm-Message-State: AAQBX9eZFnZx+QJKBYl+Dr13v2Yqlzeh03MYlTVm2Qne/Gz1vp8MP7s5
	eKGrdBjSOlHl9LFsFXdaiSo=
X-Google-Smtp-Source: AKy350axgeXrDsMz7i3yaU0RAi1gc+voidVnK36WqZSdfbvFpue+fo0Aw3nOH50MqHOvV3CiPP5KWA==
X-Received: by 2002:a05:6402:4402:b0:502:367:d5b8 with SMTP id y2-20020a056402440200b005020367d5b8mr17397382eda.4.1679950993703;
        Mon, 27 Mar 2023 14:03:13 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id p25-20020a50cd99000000b004bf76fdfdb3sm14962347edi.26.2023.03.27.14.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 14:03:04 -0700 (PDT)
Date: Mon, 27 Mar 2023 23:02:51 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 4/7] staging: rtl8192e: Remove unused if clauses in
 rtl92e_set_wireless_mode
Message-ID: <359ed203ab08afe5c2f449f40d2958868b4e55b4.1679949171.git.philipp.g.hortmann@gmail.com>
References: <cover.1679949171.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1679949171.git.philipp.g.hortmann@gmail.com>

Equation (support_mode & WIRELESS_MODE_N_24G) will always be true. Remove
resulting dead code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 21 ++------------------
 1 file changed, 2 insertions(+), 19 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index c03978353a90..689a5e16eb4d 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -598,25 +598,8 @@ void rtl92e_set_wireless_mode(struct net_device *dev, u8 wireless_mode)
 	struct r8192_priv *priv = rtllib_priv(dev);
 	u8 support_mode = (WIRELESS_MODE_N_24G | WIRELESS_MODE_G | WIRELESS_MODE_B);
 
-	if ((wireless_mode == WIRELESS_MODE_AUTO) ||
-	    ((wireless_mode & support_mode) == 0)) {
-		if (support_mode & WIRELESS_MODE_N_24G) {
-			wireless_mode = WIRELESS_MODE_N_24G;
-		} else if (support_mode & WIRELESS_MODE_N_5G) {
-			wireless_mode = WIRELESS_MODE_N_5G;
-		} else if ((support_mode & WIRELESS_MODE_A)) {
-			wireless_mode = WIRELESS_MODE_A;
-		} else if ((support_mode & WIRELESS_MODE_G)) {
-			wireless_mode = WIRELESS_MODE_G;
-		} else if ((support_mode & WIRELESS_MODE_B)) {
-			wireless_mode = WIRELESS_MODE_B;
-		} else {
-			netdev_info(dev,
-				    "%s(): Unsupported mode requested. Fallback to 802.11b\n",
-				    __func__);
-			wireless_mode = WIRELESS_MODE_B;
-		}
-	}
+	if ((wireless_mode == WIRELESS_MODE_AUTO) || ((wireless_mode & support_mode) == 0))
+		wireless_mode = WIRELESS_MODE_N_24G;
 
 	if ((wireless_mode & (WIRELESS_MODE_B | WIRELESS_MODE_G)) ==
 	    (WIRELESS_MODE_G | WIRELESS_MODE_B))
-- 
2.39.2

