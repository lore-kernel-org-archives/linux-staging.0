Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7786208D99
	for <linux-staging@lists.linux.dev>; Wed, 16 Oct 2024 12:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729083405; cv=none; b=VBUTscx3TK3okvvTfhrOnA3r6N+y+cpHMghPGb/yZ/KMcWbqJtmc4/D7+J96aRQPE5/8vNrFpvm0mMjmG3PeYSbJxmwxWw2BfSmRJ5yGEJE+MOjjZHTeWpiAXkMhTyXgTOivfmpLWATUJdIKiDGRkT9PVfgL58dooKuaOK5D8Jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729083405; c=relaxed/simple;
	bh=2iGGqAVBHJntRMHWX6jOevO8dBWQcGxKqwLVmWqYUmg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Al2xN3EyOC0I5i4nq0gQ8wP6xm1bR2WwCPI6cKYCBhFE5IrRiUILCcHn1iI/w74QIGDxYLJ/L3OLy2DYkCN6k6tbvVlQ1j1L56nDa38DZjCQ9+7gcRSOjnzHxq8ohC0+8EfGYiTIW2NLgfIlwGGzYb7dJJrS4V8bFzL+uayuZ1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jU80+TkT; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jU80+TkT"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4314b316495so11607895e9.2
        for <linux-staging@lists.linux.dev>; Wed, 16 Oct 2024 05:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729083402; x=1729688202; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1hmD6BPFZpejVOP036PkGm6Ii4/AqtCue8JTUJjawmM=;
        b=jU80+TkTg2ZAg7I72PCIgWkbyrOnBKxOYRzuUIQ6E1K7GMqTq4A3V/7OF+YVF02OOs
         8iI/LO2fH09jialeJ6vL6qDqi7jpVdpVLAXfFUvxTxR0xwa5Rzm96rjgNEaAIlbN3UF+
         mgPkNas/RbNiIFSre2vICBwaUtZOfzz0XljqaSrOnqNOJH+eipdSu2W7p0Pr1ViEVEDa
         P4AYX2KrN25yKwQqbCd2lkMZ5CrFrQHWr7GWcEX6h8upxrELJSPvkBKygRO7tmc5PfGc
         UVVKT4Ns3GUYhXjbfcnANMBknN0gGCxDy3jb9P5N1A8Hpnn23k3yeqxZvE4d3Ff0KhpJ
         AsIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729083402; x=1729688202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1hmD6BPFZpejVOP036PkGm6Ii4/AqtCue8JTUJjawmM=;
        b=aPCrxW/cKTwpqTrSwz/0aglAicwlvGoc7mOKTAl705uRK9bdlXdGFtzhNUroriGDLc
         bEhE5yMGZNeInmoMaowklBANHZ6GlRop/WCLtTIYcYO9ff0AXcYDojorNZn9eGYSG8uU
         r47jvvv2LHAj7ROu2XmBUIKqKWYjdZHr8o/kX6axCi0glEAFfRqJo0tVIHTsQkWX9on3
         Ptv/LTfVWANrrcWQewUEnF4K7HM5rPFTZBiXzjBknE6yDHh+6EegoA3oPFlTpedMUpll
         dpS6/AwFRdWtuNfxxFxt4+lPNkM9KQKlm5B7QfV5UYuXn8OLvwq6Woap6QF6RmsY1vjM
         xrkw==
X-Gm-Message-State: AOJu0Yx5vc9S+NpDuvo5aTACroibf0uBOpE8coHeq67IKlob5nJNOWbG
	0LaXMb8V1LYmQObu6SA8zG+gd5PAG8t8Gn7tzP01eTfALxdl3ZtQ
X-Google-Smtp-Source: AGHT+IE385aZY0SfaapZkgqBzf+EOTe0SjbuDc918FIA9/YVpdZgs4p/05DgQlkQXyOvpC3adHX0Yg==
X-Received: by 2002:a05:600c:3d88:b0:431:553f:ba7d with SMTP id 5b1f17b1804b1-431553fbbf7mr6508985e9.26.1729083401942;
        Wed, 16 Oct 2024 05:56:41 -0700 (PDT)
Received: from ARL1114-LINUX.. ([196.233.5.237])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fa7a13bsm4249405f8f.13.2024.10.16.05.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 05:56:41 -0700 (PDT)
From: Aymen Khalfa <a.khalfa.1012@gmail.com>
To: gregkh@linuxfoundation.org,
	hdegoede@redhat.com,
	Larry.Finger@lwfinger.net
Cc: linux-staging@lists.linux.dev,
	Aymen Khalfa <a.khalfa.1012@gmail.com>
Subject: [PATCH 3/4] drivers: staging: rtl8723bs: Fix missing blank line after declaration coding style issue.
Date: Wed, 16 Oct 2024 14:56:29 +0200
Message-Id: <20241016125630.2479807-4-a.khalfa.1012@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241016125630.2479807-1-a.khalfa.1012@gmail.com>
References: <20241016125630.2479807-1-a.khalfa.1012@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

- Add a blank line after declaring struct.

Signed-off-by: Aymen Khalfa <a.khalfa.1012@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index 56a85174965c..cc4d08ce1d2e 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -1011,6 +1011,7 @@ void rtw_free_pwrctrl_priv(struct adapter *adapter)
 inline void rtw_set_ips_deny(struct adapter *padapter, u32 ms)
 {
 	struct pwrctrl_priv *pwrpriv = adapter_to_pwrctl(padapter);
+
 	pwrpriv->ips_deny_time = jiffies + msecs_to_jiffies(ms);
 }
 
-- 
2.34.1

