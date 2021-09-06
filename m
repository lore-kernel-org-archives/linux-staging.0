Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E7D3FD5
	for <linux-staging@lists.linux.dev>; Mon,  6 Sep 2021 01:01:21 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id z9-20020a7bc149000000b002e8861aff59so3812059wmi.0
        for <linux-staging@lists.linux.dev>; Sun, 05 Sep 2021 18:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6k3O94BU/B6lxKQsYIiBmKyOBWMRvKAUVPDndT06yD0=;
        b=NFnoNcak6BMgalls+FznBghdZhdZRZUsLTI9Rs9bNnKBvLbSqeICYFoaRKcebnEl6f
         BvxmlyloXcghqprmfvxfBbdIDfnA/cvyotlPyzRiDAZEjQo5Mtzy0tOLOCIaJ3JZCO6j
         9N4b8hNM6s2JZOeOJ0NUnsoss9P/uWuuHwZVw/zL1OSDmzb/Vg0KMkIm7p09zl6W6e+m
         srAEYoBl4AbYeM+OQeoSiowQftm2AhBbtr6MYXbzkrEk8+Lt0pBcUk5+vGkPRCypHwxW
         gUS7SZQr/5NGR4KU2veky+ZD+t0sRnjXcOqBreIx9QCRLrgtoH1F7JLHhxvUvpLFN/TM
         SMuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6k3O94BU/B6lxKQsYIiBmKyOBWMRvKAUVPDndT06yD0=;
        b=dhwBuLjPhRtsHt8+oy/IUEg4glnbg4+/0FbeCWp6C0j04Rb2CtbLPd7iNLPGRQvoMn
         7ahQ6gTtnPN7v4XXAMHOj4JnQcYP+YkdiJgwsmy7uofh7NGQFa45X8lWIUDptmmE0jbO
         n2Y1612g0nD0uHcFSjhFBfiAVau9FyugqJK4Uneu186wMjgX8l9CYCJw5fbu6QOEczOe
         rb7mSKn5m6IQ0XUbgha3UyyqJDa1ei9mCJ+3yCC//gqzA1gFlB3cY4+WANMeMgOkaaHg
         g6N8JEAEii9YaD31Ri/SwAZMlbJ1YU80GkeLP/MwMt3Zrxq7u5g/wFNSkJUl1o2B89jo
         8yPA==
X-Gm-Message-State: AOAM533Xrxs/CaW6DrqrWldZhNZT92EjTocL5mWjEiBjPLOFODsKIk48
	5oBUKEjv/qgiqwFulF7HR4RoZQ==
X-Google-Smtp-Source: ABdhPJzXfs62SXQ0/tygdLtk+R/Vy0uF+6ITClv+0JG1uh9x7XEbWWB2eK1/tXQWatGWrOzr5Wybgw==
X-Received: by 2002:a05:600c:3588:: with SMTP id p8mr8878608wmq.0.1630890080194;
        Sun, 05 Sep 2021 18:01:20 -0700 (PDT)
Received: from localhost.localdomain (d.f.5.e.6.6.b.1.e.6.2.7.e.5.c.8.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0:8c5e:726e:1b66:e5fd])
        by smtp.gmail.com with ESMTPSA id r25sm5151232wrc.26.2021.09.05.18.01.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Sep 2021 18:01:19 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	straube.linux@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 14/14] staging: r8188eu: remove c2h_id_filter_ccx from struct hal_ops
Date: Mon,  6 Sep 2021 02:01:06 +0100
Message-Id: <20210906010106.898-15-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210906010106.898-1-phil@philpotter.co.uk>
References: <20210906010106.898-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove c2h_id_filter_ccx function pointer from struct hal_ops, as it
is unused.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/r8188eu/include/hal_intf.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index 6deecbbc284d..efc2d9955efb 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -242,7 +242,6 @@ struct hal_ops {
 				  u32 bndy_cnt);
 
 	void (*hal_notch_filter)(struct adapter *adapter, bool enable);
-	c2h_id_filter c2h_id_filter_ccx;
 };
 
 #define RF_CHANGE_BY_INIT	0
-- 
2.31.1

