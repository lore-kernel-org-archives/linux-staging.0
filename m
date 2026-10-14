Received: from mail-wm2-f10.google.com (mail-wm2-f10.google.com [74.125.225.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1558851DDE0
	for <linux-staging@lists.linux.dev>; Wed, 14 Oct 2026 13:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791984085; cv=none; b=fpiHAou/QLS+F9hDSpmcfSGxrLDgADiJLGowSXO736GwOUBWhhXCN3RPtzHoqkUwxYyd+n8mg9O+ISKCMSWUa2fVSyx7eTLQoaoEa6PRL8eUq+PcOabQA8EhNKo0uhYGRxCVb0hVAUPwWt/FW6MdrQvb8ADrXKxDi9JtPIZgITM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791984085; c=relaxed/simple;
	bh=+2DksuN0PXimCBlfhp3flMUyobqYYJ1LAz/bP03IRBA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NuuNQTLkQiBpKDLGJt4EMiAn+nbpUq57pneM+CYiZeZkPHCWY/E385xk0q8nzHuj6JnG+IYrvwEryfeo5IgOI5c1vtgv+9NTG9+tDv3yD/VMG7ftilC2BzM7uP0rE94zidBCefaH+qweW8w3KVwVPrn3H7oq21gr53rIPRqn2IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cjIfWvvQ; arc=none smtp.client-ip=74.125.225.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cjIfWvvQ"
Received: by mail-wm2-f10.google.com with SMTP id 5b1f17b1804b1-4a16dfb8fa6so3837915e9.1
        for <linux-staging@lists.linux.dev>; Wed, 14 Oct 2026 06:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791984080; x=1792588880; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mH8cYaV01On54VD3MX65wnE47n38Aav2xpeeuVOOg0E=;
        b=cjIfWvvQzR+GCA/zmIdtKi9/x6B25wVEMjQIuU8FosfU0WAzQECKHLG/5m312564b/
         vuiIvdtaP3RAnisVem0+ZIKBTS/cIAa9Ej2Q2p5fYpDdcJZSD4G9rJm8LNflZBZpTA+6
         59eQaSqohHgYb06IprM9meLuX2WVIQpMBC6PcozhczmR+Ecw728fGPnEp/hZ7SZgliu7
         mgmukAp2GVx1KDB55xjVtWIC+g/Yn6U1uk4newM0CWfOAh+lEh8516AjTjkiOo/Tty/x
         UZ2fzcm1pws0rT8q1TLHFyrQKHAgYzVz3MVfEwzIeIhcQFIQcxnRz0pT9c34uRxNZ+zQ
         lPtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791984080; x=1792588880;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mH8cYaV01On54VD3MX65wnE47n38Aav2xpeeuVOOg0E=;
        b=wOyhbu+xBw9y1szG0pIiV0N61w4iPfHKV1RXin775XX5s+zONyYs41X7a+MsOOQ8Wu
         5axaJb83m57GExg8EfSgV0opnq4tF/gcvUNX7MMaMw6i7WW8gtZlkoFj+tY/NpqOdrsY
         L3IvQVS1A0dBPZPkiNjl+bgeNJeyc+O+QynnIPaWnpkvaswt0QTQ8CJe3anZjfwG1E4t
         rA/Tbr+NJCUgtwKK4M05DqQNDXQcB33wsXBnMovfY4cUjdx+2NCDiLWQc5tvilU5I9FP
         vHfEoqK6WJO6tQ3v6I4nAzPVMGb7AcduYK7hbYUNzfWbWCFrhvt5maQK2zLa4ZhCePGG
         Em8w==
X-Gm-Message-State: AFq9FYJ3I6vPUe9Sc4GDoSoYV45DdJZqygaeoIhkGGLdxi9chvJptb7K
	dMOiYnPzSNXEyz0FwOI/pK5F2cXa7uQy+JCiLDPY6QkrkeE7AzBQ1tQ9
X-Gm-Gg: AYBFou2rxhmK4qd1mp4gqsLl0QEWJRF7eFukePtu/IzpIGi+HiZOB6Rt20PRlGzwi6Z
	8cUUv8vhHOj2LvRS4ZH0YQ7lbjFzQ4kJvniSLtKmhH8vzfpMYWoWwMFNT2VTmTtZSLYZasXD7zz
	prK1T99QmxVIqsF0zODlEPTtDmwO00bU7TXmJqrqWt0iGxABanXT5PXd87mLE1nUk4v0SRtM+XN
	RJN5Bkk+BNy7tTKBtsFl5puQ4H2p8RIRCzqH0w98/pio/JpGAqPQgJ0CVusmBjveEAEucelEWHr
	prrk0MymEVyRRjROb5sk/CN5VjgpFQLhGu8UMXEEMMqrZW9KfXJ3IYydHVQmo+i3xq71HHA0VGZ
	GvFxtijD4qtxa58L8I4VSxyqKjkFETSw4dw31bTJHTWH18O/bHAZ3r9aGSKsbjkxKytCLGDlhMk
	h199milTwM6TVGezUFKAIWCisghVnfcDCj5Z/wDcQ6D3gC7yozkUHzVSrBPiWZkgxvLbWNfg==
X-Received: by 2002:a05:600c:524a:b0:49b:9202:6f80 with SMTP id 5b1f17b1804b1-4a18e4a4f2amr317315465e9.6.1791984079883;
        Wed, 14 Oct 2026 06:21:19 -0700 (PDT)
Received: from fedora41 ([37.168.54.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bcf2537fsm1250895e9.8.2026.10.14.06.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 06:21:19 -0700 (PDT)
From: Timo Joannin <timo.joannin@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	guojy.bj@gmail.com,
	error27@gmail.com,
	Timo Joannin <timo.joannin@gmail.com>
Subject: [PATCH v6] staging: rtl8723bs: remove unused phy_stat struct and dead prototype
Date: Wed, 14 Oct 2026 15:21:07 +0200
Message-ID: <20261014132107.171964-1-timo.joannin@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit d355fbb22519 ("staging: rtl8723bs: rename phy_status_rpt_8192cd_t
to rtl8723bs_phy_status_rpt.") renamed struct phy_status_rpt_8192cd_t
and propagated its type through the call chain.

Remove the remaining unused phy_stat struct in rtl8192c_recv.h along
with the dead function prototype rtl8723b_query_rx_phy_status() in
rtl8723b_recv.h which referenced it.

Signed-off-by: Timo Joannin <timo.joannin@gmail.com>
---
Note: While rebasing onto staging-testing as requested in v4, I noticed
that the struct rename and u8 * cast cleanup from v2/v3 were already
applied to staging-testing in commit d355fbb22519 ("staging: rtl8723bs:
rename phy_status_rpt_8192cd_t to rtl8723bs_phy_status_rpt.").
This v6 patch contains only the remaining change from v4/v5: removing
the unused phy_stat struct and dead prototype.

Changes in v6:
- Fixed build failure in v5 caused by leftover rebase conflict markers
  in odm_HWConfig.c.
- Dropped patch 1/2 and the cast cleanup from patch 2/2 as they are
  already in staging-testing.
- Updated subject and commit message to reflect only the remaining
  phy_stat struct and dead prototype removal.

Changes in v5:
- Rebased against the latest staging/staging-testing branch.
- Resolved minor merge conflicts in odm_HWConfig.c.

Changes in v4:
- Split monolithic patch into 2-part series.
- Removed dead struct phy_stat and unused prototype
  rtl8723b_query_rx_phy_status().

Changes in v3:
- Included patch version changelog (missed in v2, sorry).

Changes in v2:
- Propagated the real struct type through
  the call chain to remove u8 * casting.

 .../staging/rtl8723bs/include/rtl8192c_recv.h  | 18 ------------------
 .../staging/rtl8723bs/include/rtl8723b_recv.h  |  1 -
 2 files changed, 19 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtl8192c_recv.h b/drivers/staging/rtl8723bs/include/rtl8192c_recv.h
index b63625ab4e45..072e2b5f6129 100644
--- a/drivers/staging/rtl8723bs/include/rtl8192c_recv.h
+++ b/drivers/staging/rtl8723bs/include/rtl8192c_recv.h
@@ -9,24 +9,6 @@
 
 #define MAX_RECVBUF_SZ (10240)
 
-struct phy_stat {
-	unsigned int phydw0;
-
-	unsigned int phydw1;
-
-	unsigned int phydw2;
-
-	unsigned int phydw3;
-
-	unsigned int phydw4;
-
-	unsigned int phydw5;
-
-	unsigned int phydw6;
-
-	unsigned int phydw7;
-};
-
 /*  Rx smooth factor */
 #define	Rx_Smooth_Factor (20)
 
diff --git a/drivers/staging/rtl8723bs/include/rtl8723b_recv.h b/drivers/staging/rtl8723bs/include/rtl8723b_recv.h
index e9ebecb224a6..2f230e2d27a4 100644
--- a/drivers/staging/rtl8723bs/include/rtl8723b_recv.h
+++ b/drivers/staging/rtl8723bs/include/rtl8723b_recv.h
@@ -84,7 +84,6 @@ struct rxreport_8723b {
 s32 rtl8723bs_init_recv_priv(struct adapter *padapter);
 void rtl8723bs_free_recv_priv(struct adapter *padapter);
 
-void rtl8723b_query_rx_phy_status(union recv_frame *prframe, struct phy_stat *pphy_stat);
 void rtl8723b_process_phy_info(struct adapter *padapter, void *prframe);
 
 void rtl8723b_read_chip_version(struct adapter *padapter);
-- 
2.56.0

