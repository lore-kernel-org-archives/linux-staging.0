Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2593B17CA3
	for <linux-staging@lists.linux.dev>; Tue, 22 Nov 2022 22:46:25 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id bs21so27009345wrb.4
        for <linux-staging@lists.linux.dev>; Tue, 22 Nov 2022 14:46:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HLjjlcGTaW2VPVbDaaDB7cRE9v4ZMit0fR2VgDn30QM=;
        b=HTTkiYlIc9Ku+jNrHublAdad+nJaZNuUMCLWS0dq7OdKjZjk8DQKouCO+fBmIJXUr1
         6Gj+FOHaPiWkfl2lUWAM0X5349dLz0y6ZkgASzs3o8LKGrcVIcRwK4o/scaGira1Jbn5
         G2HZx9wQ2AU3FpjfYm33eUHPqhlQY0QfjMYrV7jfTLWgTkNWvTFwScR3b+cXfXXaX+JX
         cPKke3t2xd/1eg2v3Aj2lPFEOqzt1PpEQOuAFtrU/ZG6205y4XYsQG8tUKAwuwVPMHKa
         b17lcPfd6pnV6vbPWrda9dPDYfx8xHx/my+i13j16wQkMD3Nj28y515hKjQywLUqFYsl
         viHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HLjjlcGTaW2VPVbDaaDB7cRE9v4ZMit0fR2VgDn30QM=;
        b=1fBZR3exH7PnEzyosWkqFA4I+yjE1xPZWaYHH0/z3bbjxNsgvfVjeOvjKad3h6Cb33
         JGBic/4rspJM+sDN9C9ge+NpNnwQ3oSnk8tikBDC1EPA67vBOHSZCBejdKUZ0NaLQ+hO
         41+nJ3CP3isHMAfIyO/pCN+Sq4eARK64+2HA4ARwW+DMWx4VsnAhqLkEjAUpS2OzI29E
         5uE8bskIGLbRzx9Ez4JLc5cezoVPAO3OFhv360j4QwL4Ngl/9Ey+bYzhvvCjZnmsTCJj
         2DvUI3Eo/FV2YLTpKAOeXkx/AkfB+m+AAgrm1ioN8E1Wz0qTEOXjhDHp4lNl0XkpzXGI
         eOvQ==
X-Gm-Message-State: ANoB5pkn+Tjiy1HghJKqiaLWmoJYSx6IZqMgbbM1l1f8X39uDzSdc5Oc
	J3QeGjfwj8IBb3YijIBd2L/Qw2pcshs=
X-Google-Smtp-Source: AA0mqf5XugPomKIinxu2xA5lQFggHnOmjU9XgebG8dPdPCVUfTH53hlM8f4GVwCweODBIXv/4e9sRQ==
X-Received: by 2002:adf:ea52:0:b0:241:b999:9e8f with SMTP id j18-20020adfea52000000b00241b9999e8fmr14552580wrn.151.1669157183435;
        Tue, 22 Nov 2022 14:46:23 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p54a07888.dip0.t-ipconnect.de. [84.160.120.136])
        by smtp.gmail.com with ESMTPSA id t5-20020a1c7705000000b003cfd4e6400csm154351wmi.19.2022.11.22.14.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 14:46:22 -0800 (PST)
Date: Tue, 22 Nov 2022 23:46:21 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] staging: rtl8192e: Remove unused variable
 ChannelAccessSetting
Message-ID: <b88a31954532f47a4caf9abfcad8e20b32a618cc.1669156825.git.philipp.g.hortmann@gmail.com>
References: <cover.1669156825.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1669156825.git.philipp.g.hortmann@gmail.com>

ChannelAccessSetting is never used. Remove resulting dead code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
index 1c00ad709a3c..ca2e685148d4 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
@@ -234,15 +234,6 @@ struct rt_stats {
 	u32	CurrentShowTxate;
 };
 
-struct channel_access_setting {
-	u16 SIFS_Timer;
-	u16 DIFS_Timer;
-	u16 SlotTimeTimer;
-	u16 EIFS_Timer;
-	u16 CWminIndex;
-	u16 CWmaxIndex;
-};
-
 struct init_gain {
 	u8	xaagccore1;
 	u8	xbagccore1;
@@ -321,9 +312,6 @@ struct r8192_priv {
 	struct delayed_work		txpower_tracking_wq;
 	struct delayed_work		rfpath_check_wq;
 	struct delayed_work		gpio_change_rf_wq;
-
-	struct channel_access_setting ChannelAccessSetting;
-
 	struct rtl819x_ops			*ops;
 	struct rtllib_device			*rtllib;
 
-- 
2.37.3

