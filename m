Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C1A3054DD
	for <linux-staging@lists.linux.dev>; Fri, 22 Aug 2025 13:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755870917; cv=none; b=Phi7+s1KVhxucLyCLkhVEEYFR29ML8Ha/kpqiGPI/1KOhuoYINPbQNmTPxW2Y1Vs9y8UvfYFWtdsf5XV2BWn+KVV5DYDDwH5aChNdo9sI1Az7+LJa3VjAUSM83ANs/ZHWBvmdMCYdMzaUJUjTtb538gMgEm9oKOhoZJBZWBDthQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755870917; c=relaxed/simple;
	bh=R3oqzf3wa2LR6puv2br3z0rq95DJFwm4VLYG9IOG05I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VS7riTTvIm5lAmvHYFYQTYeThodDKbJX0kZkjH3V9w9+jThB+4ByNRD9/XDBlH/pyGuQxvcBAPdOkqt1319/YYA99Ef7AtQJ1Hvrwuvq9SbEuyhQW8SlxFg1kw05a7aSuqUzvwsH+uEZfv8HxmcSxKbhtZv+n4PBwzqYCNW2aTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gJ8v6lrX; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gJ8v6lrX"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-afcb78c66dcso311961266b.1
        for <linux-staging@lists.linux.dev>; Fri, 22 Aug 2025 06:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755870914; x=1756475714; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a2o0CeOSz04raE18RE0kbNDsnmsiaJEig/8+BAKswj0=;
        b=gJ8v6lrXxV/IuqloCeKVDDrVn1gZ4c2fEkDDJtzBQDRxHci+3gr6O5nLDP3smduYl1
         SdOYtKYC1yT5GmX1cEcRzIWFo+DQ/UqJ+jHgSfhAVdzbQVSsXHvSB7glh5Xey9UwekyS
         vKo460HVXa3sWrNqZtHgmGbucsRwh6i3W7eOc1PPEBvYHdB+zZkKprUWnF7+XZPpkuG6
         czt9wQt+Bhqfs4A7lnjDjdCqDuAQi0vG9eQyTvfaV8TY+QSSnX35t18X04YgO+1hMLFV
         OFW8xsSmCo0P8COoA26S2BVJVHJ159bQnKy8ID2xIXZmgCCcI9Mry5UJnWBrNqF3jg17
         d3Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755870914; x=1756475714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a2o0CeOSz04raE18RE0kbNDsnmsiaJEig/8+BAKswj0=;
        b=ScnIe8nKcclPIREAa2udVHNu5yY9qBruhBsTBg+kaC3q3PeOfXp1BUlc97Yg/rbyJg
         CQEXP+Rt5CewaaszQUfq2O2GqXdwhYvjSwu+rspiS3DQfyNawAxGKJYRB6aeXsR8bUwp
         GpV28EjxiQuzvPdh7IMhg+bS2L3MoMPGXVG214wMWhLZeXjr3kioM1eijV/02cUwxLQH
         srL63vD1InwAX3j4JPUA/fgmwBT37kHE1+9mR6PX/l1H7wF43gszx/VTqRHIOGgMEXyq
         MEFR4WYJQt2xaJL7adqNrKB6Q7XuxfYr1Dq/me9cb3eis2EiZY1E4TgvcEXE2lrjaONV
         DWjw==
X-Forwarded-Encrypted: i=1; AJvYcCVnjCis4mGdtKhCKNPlmZel3mWRwu+iYwN+YQ/xTlzyNGCi3p5LBHepYW26iHMXJenokkN1Srp2aw4cutlC@lists.linux.dev
X-Gm-Message-State: AOJu0Ywuq1uiCL9+Cl5y5kOMwF+Tqq/Ru1m1ZaRYXXjFFTg0WQUqlx8P
	2UgppR/UH6hMqGJp65/ukwp91apFTuT1IlPp9EPIDDq6pNOJykGga7gP
X-Gm-Gg: ASbGnctum+tEf0YQ1O5zd6xvfhAmfwHlzC809xgIiCKzrtb1BFzJtHyM6BY0N0Ys/lg
	Ut1lW/puDxEafkOIqW8sVQo1HZ3rJbSEMe2BYTJ+G/TpZcqQlR8/Yj9mtkcUvi7Tiw9AfnGIST2
	rxX/Vhr77h9cja2L+8chdSl1uX0th+UQaY8mT/fq7DKzyZjurOIRM9SvtMurzvM5GVqrkVgkHY2
	bwiLhtIts1WHbXDnuf6ZDm+zWYFBTZ95zEEUSiICt7ibm7YxoUefRXJaL2+ecDk0jkgl3cyF25a
	y0dghgBbDqnKVd3NyELtutXIjI+vhiL5YuRJSc4iaJUkAwfhs5ZPMP/u/aZfGkvf7o88tiMNWtw
	m6dzRB0Pmq4ib/4jKsfMkPgy9Iw==
X-Google-Smtp-Source: AGHT+IGM2GDwp1bQevo0lLrU58gx0NnBb1Q90saSLYzZM2EePT3AN8DcFxEix8wslUnJoAuwF6Go3A==
X-Received: by 2002:a17:907:97c5:b0:ad2:425c:27ce with SMTP id a640c23a62f3a-afe28ec5d10mr257724266b.2.1755870914032;
        Fri, 22 Aug 2025 06:55:14 -0700 (PDT)
Received: from tumbleweed ([95.90.184.246])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afded307138sm612353866b.45.2025.08.22.06.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 06:55:13 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 06/13] staging: rtl8723bs: merge rtw_os_recv_resource_free into rtw_recv.c
Date: Fri, 22 Aug 2025 15:54:11 +0200
Message-ID: <20250822135418.118115-7-straube.linux@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250822135418.118115-1-straube.linux@gmail.com>
References: <20250822135418.118115-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Merge the functionality of rtw_os_recv_resource_free in os_dep/recv_linux.c
into _rtw_free_recv_priv in core/rtw_recv.c to reduce code in the os_dep
directory.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_recv.c      | 13 ++++++++++++-
 drivers/staging/rtl8723bs/include/recv_osdep.h |  3 ---
 drivers/staging/rtl8723bs/os_dep/recv_linux.c  | 18 ------------------
 3 files changed, 12 insertions(+), 22 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index fcc28d4556c5..cda51aab752d 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -91,11 +91,22 @@ signed int _rtw_init_recv_priv(struct recv_priv *precvpriv, struct adapter *pada
 
 void _rtw_free_recv_priv(struct recv_priv *precvpriv)
 {
+	signed int i;
+	union recv_frame *precvframe;
 	struct adapter	*padapter = precvpriv->adapter;
 
 	rtw_free_uc_swdec_pending_queue(padapter);
 
-	rtw_os_recv_resource_free(precvpriv);
+	precvframe = (union recv_frame *)precvpriv->precv_frame_buf;
+
+	for (i = 0; i < NR_RECVFRAME; i++) {
+		if (precvframe->u.hdr.pkt) {
+			/* free skb by driver */
+			dev_kfree_skb_any(precvframe->u.hdr.pkt);
+			precvframe->u.hdr.pkt = NULL;
+		}
+		precvframe++;
+	}
 
 	vfree(precvpriv->pallocated_frame_buf);
 
diff --git a/drivers/staging/rtl8723bs/include/recv_osdep.h b/drivers/staging/rtl8723bs/include/recv_osdep.h
index 763ddef4ad90..9b3f4e8293ee 100644
--- a/drivers/staging/rtl8723bs/include/recv_osdep.h
+++ b/drivers/staging/rtl8723bs/include/recv_osdep.h
@@ -18,9 +18,6 @@ extern void rtw_recv_returnpacket(struct net_device *cnxt, struct sk_buff *pretu
 int	rtw_init_recv_priv(struct recv_priv *precvpriv, struct adapter *padapter);
 void rtw_free_recv_priv(struct recv_priv *precvpriv);
 
-
-void rtw_os_recv_resource_free(struct recv_priv *precvpriv);
-
 void rtw_os_recvbuf_resource_free(struct adapter *padapter, struct recv_buf *precvbuf);
 
 struct sk_buff *rtw_os_alloc_msdu_pkt(union recv_frame *prframe, u16 nSubframe_Length, u8 *pdata);
diff --git a/drivers/staging/rtl8723bs/os_dep/recv_linux.c b/drivers/staging/rtl8723bs/os_dep/recv_linux.c
index ccd00f8bee7e..c71e0c762f4f 100644
--- a/drivers/staging/rtl8723bs/os_dep/recv_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/recv_linux.c
@@ -9,24 +9,6 @@
 #include <net/cfg80211.h>
 #include <linux/unaligned.h>
 
-/* free os related resource in union recv_frame */
-void rtw_os_recv_resource_free(struct recv_priv *precvpriv)
-{
-	signed int i;
-	union recv_frame *precvframe;
-
-	precvframe = (union recv_frame *) precvpriv->precv_frame_buf;
-
-	for (i = 0; i < NR_RECVFRAME; i++) {
-		if (precvframe->u.hdr.pkt) {
-			/* free skb by driver */
-			dev_kfree_skb_any(precvframe->u.hdr.pkt);
-			precvframe->u.hdr.pkt = NULL;
-		}
-		precvframe++;
-	}
-}
-
 /* free os related resource in struct recv_buf */
 void rtw_os_recvbuf_resource_free(struct adapter *padapter, struct recv_buf *precvbuf)
 {
-- 
2.51.0

