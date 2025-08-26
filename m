Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84F0286D57
	for <linux-staging@lists.linux.dev>; Tue, 26 Aug 2025 10:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756205060; cv=none; b=sCYqNmqsRCHJRq6ByUmxMBtNYkYz/7KTDEIQKvH07w1US+ZE1paYqODcOFt3MCI7UycvxmXLeBCKEkjapx+7hXzbsjqYEtTatH06koAQwR1WXhNOe/vNn3RqMtEyRge2yUelNZ9R6NxgtGB8/Cg7mxYkW3Fw9j6Tdw3Y/UZ6iTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756205060; c=relaxed/simple;
	bh=Qv97zhwU2pw0hz1dJh4Hg/76/dsJkZV2PExCzS2Vuug=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=rH9sgq/PkcpCAhcBBfA+QHt4tV3dpGPJOSyn9MMf7UElVrodGpSYtyhycu0gaztc+MUp2NQVimlE5TTq0XrjGVkOB0xJJ5xmzdD+vnXiCLl2zJUTCggwWuYMssNDmbZUfqdRzu4vNkq788/l0nrK+cJPvtPn2GmbhC9pWygiJ5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--abarnas.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RQ109ZgW; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--abarnas.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RQ109ZgW"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-45b4e345ce4so20424575e9.2
        for <linux-staging@lists.linux.dev>; Tue, 26 Aug 2025 03:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756205057; x=1756809857; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pXOFzMvqwxJwWOUNietR8Iur6GTKdJ2P4bWvUnRoWzM=;
        b=RQ109ZgWvo/l4g/UDFSYfpyXrf/lb7PJA12VkegZ7SYqgQzLGRKh7LZj24nSqyK4zK
         RgsfP19dGKPQruqYy76OwzuaPg1HpnpKuPlrxRyfu4xHniVg1keM0uRnaTazMRiJZMLp
         jTJJ0QYYc+Q06qeX3DUWEh2UyJzPyIKTGKBa4VolzDD4tNeV2x3h1XDgGD8JAPMOlQl9
         Rr/W3maD/amDTpK+kC87m89EPFN5UEqiwFkF9JhCa2HMUzKWEOvwzBWD8wjqO/WejH3B
         kfPhF3y9YrZqInRXBxe7TYpqj3iqd0G1yYqYeyoXMSt61JjTdmCmUuhmPGUuVPtO+MyJ
         x2lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756205057; x=1756809857;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pXOFzMvqwxJwWOUNietR8Iur6GTKdJ2P4bWvUnRoWzM=;
        b=e+497E0jCfqgT/IGFrEHVh64Hri9owI51Dh/Z0g/qZabgOXL0mvRub4hae0I7xrHV+
         TCk3U0YG3gU2H1F8mNe/d1vpZu/3JdGNVFHMM4S0RFBGumcevuDtcknPqgJzPx1AGH3J
         mgrkX2FE8WTenhngixsu2L5GsLXynNdmQotY4/7JltANFo4HmT9BoMAk70IHpqn/t7EY
         3SEKD1RTtUUbzQXzy47ok+y1Ev0IK9RnGGnZ04NOOx6KnEDBT32od9HkSQIMxoeUwVCp
         H41TlH0yXHL4gX9Cjic5SPCQvQumCQaeEkrIrEj8YYEvdrt7D6dD/WUno/qlZllwbt0l
         G9yw==
X-Forwarded-Encrypted: i=1; AJvYcCXF6PxiAr6twTNIqFPqZh6jR9Uk0g+T8H9uQjRD+mwNilccaHtgiFKbD3zxASPlPnuT5gk9aOP00HUc+UHw@lists.linux.dev
X-Gm-Message-State: AOJu0YzyxJUl+7vrDVXiM9j1DPFH6THEcbaZkXEe0IqxjLiD2zA06vtm
	kPHOlaoctqzaOIcOJ/4uVoOdDvPG9hwhP5ZubCBTPuCigQ2Opji/TLo291SV5tkCHBQ+URYfTqE
	2HL/Yye2kog==
X-Google-Smtp-Source: AGHT+IGgdWlyYKnRmm81Z3uoAruDXmZxLHozp40Vp5xHDoqvmExAZ8rGkE7VjTNkwaFrSkcz3uIErxD/64kI
X-Received: from wmbfa15.prod.google.com ([2002:a05:600c:518f:b0:458:bd57:d118])
 (user=abarnas job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:b95:b0:459:d645:bff7
 with SMTP id 5b1f17b1804b1-45b5179cf7dmr132133955e9.12.1756205057180; Tue, 26
 Aug 2025 03:44:17 -0700 (PDT)
Date: Tue, 26 Aug 2025 10:44:11 +0000
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.261.g7ce5a0a67e-goog
Message-ID: <20250826104414.2817514-1-abarnas@google.com>
Subject: [PATCH 1/4] staging: media: atomisp: Remove unnecessary forward declarations
From: "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>
To: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev
Cc: "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Get rid of fifo_monitor_status_valid() and fifo_monitor_status_accept()
forward declaration because it brings no value.

Signed-off-by: Adrian Barna=C5=9B <abarnas@google.com>
---
 .../hive_isp_css_common/host/fifo_monitor.c   | 44 +++++++------------
 1 file changed, 16 insertions(+), 28 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/fif=
o_monitor.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/fi=
fo_monitor.c
index f0de788154560..c5f78c5cf04c6 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/fifo_monit=
or.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/fifo_monit=
or.c
@@ -31,15 +31,23 @@ STORAGE_CLASS_FIFO_MONITOR_DATA unsigned int FIFO_SWITC=
H_ADDR[N_FIFO_SWITCH] =3D {
 #include "fifo_monitor_private.h"
 #endif /* __INLINE_FIFO_MONITOR__ */
=20
-static inline bool fifo_monitor_status_valid(
-    const fifo_monitor_ID_t		ID,
-    const unsigned int			reg,
-    const unsigned int			port_id);
+static inline bool fifo_monitor_status_valid(const fifo_monitor_ID_t ID,
+					     const unsigned int reg,
+					     const unsigned int port_id)
+{
+	hrt_data data =3D fifo_monitor_reg_load(ID, reg);
=20
-static inline bool fifo_monitor_status_accept(
-    const fifo_monitor_ID_t		ID,
-    const unsigned int			reg,
-    const unsigned int			port_id);
+	return (data >> (((port_id * 2) + _hive_str_mon_valid_offset))) & 0x1;
+}
+
+static inline bool fifo_monitor_status_accept(const fifo_monitor_ID_t ID,
+					      const unsigned int reg,
+					      const unsigned int port_id)
+{
+	hrt_data data =3D fifo_monitor_reg_load(ID, reg);
+
+	return (data >> (((port_id * 2) + _hive_str_mon_accept_offset))) & 0x1;
+}
=20
 void fifo_channel_get_state(
     const fifo_monitor_ID_t		ID,
@@ -539,23 +547,3 @@ void fifo_monitor_get_state(
 	}
 	return;
 }
-
-static inline bool fifo_monitor_status_valid(
-    const fifo_monitor_ID_t		ID,
-    const unsigned int			reg,
-    const unsigned int			port_id)
-{
-	hrt_data	data =3D fifo_monitor_reg_load(ID, reg);
-
-	return (data >> (((port_id * 2) + _hive_str_mon_valid_offset))) & 0x1;
-}
-
-static inline bool fifo_monitor_status_accept(
-    const fifo_monitor_ID_t		ID,
-    const unsigned int			reg,
-    const unsigned int			port_id)
-{
-	hrt_data	data =3D fifo_monitor_reg_load(ID, reg);
-
-	return (data >> (((port_id * 2) + _hive_str_mon_accept_offset))) & 0x1;
-}
--=20
2.51.0.261.g7ce5a0a67e-goog

