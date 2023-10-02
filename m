Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604BF1E523
	for <linux-staging@lists.linux.dev>; Mon,  2 Oct 2023 17:53:42 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-53142351997so4191033a12.1
        for <linux-staging@lists.linux.dev>; Mon, 02 Oct 2023 10:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696269220; x=1696874020; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qji/asc5BFgCecowyKzRvOvxJoUOq3ag30EUXlyRUKs=;
        b=loMSPAiRrACKbRcLZcSOjLQGFxAR01QOI/++ynlhnPZ2mhna8wO6zJ+MzHeeaZj4F9
         I003+kFZJYt4Kn7HB6pErHTBwhco5aW3qTxZq+jPrxAz0rvDJlbE0jJM+lgFd8kRnzDg
         FfHc4Pg5yXlZGutImQjOtMLF9f4v+ugWIUiCwuPbc5u9nF6inmglsMW6H3IBwFR9vgcv
         6ZGpTZrdFpY4/QBmVlsWdjin/IWolkOSYFwffhvMnZ6FmfXXGSLWv4iif2q068Zr13bZ
         k0SoDXnV1vhP1Uzr6DVXq1DX8GyfX5Y6Q4s36Uvw2QoJ6l3E+ZkAHE7imzTLNQKcN84h
         0v+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696269220; x=1696874020;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qji/asc5BFgCecowyKzRvOvxJoUOq3ag30EUXlyRUKs=;
        b=UxiG2yO0NdwKfTKFn6HPto0B1u1NQ7mReLafTrr2qjRktvBkAMCwmi0Djv5zngxgX7
         E01U1fCwHefLjh8hjru/KjYBskoL9WgoA4lCFRLbxnsexmfVKrzTmnzDtXPqF1CO/Dgv
         cdhNAPD+SvlGW498+Cx2YaOMdD/WRn6Wzkr5qdg/axKxtwHUo6+97qJAMIeOHohhGin0
         Zy/kCLel5/GFvrWHx6vzDPsODRA91Q+KsEabVIrlW7wWSkrhXF1QzYI8Kw4Wh9hTd6/+
         n33f48rLqSLCXJqu74CUwIR3qw7qqOxUkIQg5RzM+UcKcsuqYgaoWPSYfb72YvLpCkOO
         D2Kg==
X-Gm-Message-State: AOJu0Yz6ROWqwN1qq7GGTDhtgAMK+TaDLgYO0ASd71/sSOaWo5LUn519
	kbwD8H8t52jkJzzVXGaqxAg=
X-Google-Smtp-Source: AGHT+IFByP88id4SK3YuKR3PUATH7q6MIR68JqtgsgQiF8X0mqXbh27Oq3G+tLIZ8mrYaBWZTQ8jmw==
X-Received: by 2002:a05:6402:2802:b0:523:37cf:6f37 with SMTP id h2-20020a056402280200b0052337cf6f37mr12123619ede.4.1696269220639;
        Mon, 02 Oct 2023 10:53:40 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id es9-20020a056402380900b00536275c28dbsm6886221edb.94.2023.10.02.10.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 10:53:40 -0700 (PDT)
Date: Mon, 2 Oct 2023 19:53:38 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 6/8] staging: rtl8192e: Remove unused variable
 rfc_txpowertrackingindex
Message-ID: <20a1f7b8297e93e2f0e593f3ddd772ff10d1fecb.1696266965.git.philipp.g.hortmann@gmail.com>
References: <cover.1696266964.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1696266964.git.philipp.g.hortmann@gmail.com>

rfc_txpowertrackingindex is initialized to 0 and unchanged. Remove dead
code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 1 -
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index c4688c273f4b..1f3a2bee247f 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -752,7 +752,6 @@ static void _rtl92e_init_priv_variable(struct net_device *dev)
 	priv->bcck_in_ch14 = false;
 	priv->cck_present_attn = 0;
 	priv->rfa_txpowertrackingindex = 0;
-	priv->rfc_txpowertrackingindex = 0;
 	priv->cck_pwr_enl = 6;
 	memset(priv->rtllib->swcamtable, 0, sizeof(struct sw_cam_table) * 32);
 	priv->rx_ctr = 0;
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
index deb707dfa443..922231274f4b 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
@@ -344,7 +344,6 @@ struct r8192_priv {
 	u8		rfa_txpowertrackingindex;
 	u8		rfa_txpowertrackingindex_real;
 	u8		rfa_txpowertracking_default;
-	u8		rfc_txpowertrackingindex;
 	bool		btxpower_tracking;
 	bool		bcck_in_ch14;
 
-- 
2.42.0

