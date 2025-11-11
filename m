Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D332F1FD5
	for <linux-staging@lists.linux.dev>; Tue, 11 Nov 2025 09:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762854342; cv=none; b=VTGhChP+bJkhB/mMe5OcG/XN8hWGzvP9OySE2GscG1nuz+TzR/RyvEIkLwTo5KigevrCtzs63KpBmdChLSqPFQvuhMEXlRcEGpDrWHYVP6+EEpqotExY2gthQr0htf3e8cBAASD5Ep8d9JjENNvPWmz99GdnYppa6JBtP//Zl/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762854342; c=relaxed/simple;
	bh=WXAUFpot/YOOxCt0RLHbf9z3/pZu8a+/URwWY7MqSXw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EL0eYEPG+//nSqe8LDz4xqm/VoxAn1tw6mFRnh4PtvjFWZe4An1gj91ZTldwqi6rinmCpcAl+pQrlshhM2h5O5cVwOMDDc4hobaOddRzdY4pKRODDPtk5/DpZ4TbOp7i8WtBFKw//6QeOhBFjfnPeRlG0B2ObIBhw02PXmVaVgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PwxXm2VE; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PwxXm2VE"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4710a1f9e4cso30122885e9.0
        for <linux-staging@lists.linux.dev>; Tue, 11 Nov 2025 01:45:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762854339; x=1763459139; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ul8zTonMF1PfgvC0/yS4S7Zbq66IyVRp1d53PsJJrsI=;
        b=PwxXm2VENS3iVlkJJkuKMCfnQUKgIOZVDhvhzOIW9AEuoaLL6oOR6tAmCZtxVa7nuf
         IwMjHwf25J8WBR0ik8WKmJg91xmFvtF6rew+dWPudnRuAAn9Z9rkSf2d8iHWG7kHR5C4
         2EW9x94MdqRqViRimmFLspslmaAY6YspNRTE3gdyAPLPLY4s3dTfiOLw3kSvOpvJiOVc
         2RgtzCXb4BgwNv9LpVN5gEL5NgWgz48MKjXc/uqE5UkvU/44vsATHjN7Ie+vdNm8EDH8
         w8WUmnNKM/dULBOSABoX1D4Pt9f3JnAZrf0ZJM4lreD1/50cW30TO2yqd3qHtOl7OACV
         bbmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762854339; x=1763459139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ul8zTonMF1PfgvC0/yS4S7Zbq66IyVRp1d53PsJJrsI=;
        b=ZMglJLoJMkeTaxQc08w1WB2SM4uvNd3SAFG6t7/I2pZ0g9TjtwGThjD3UVyWWUb/hQ
         A1AWnPJUTuQCOKS50ZORYDpLQ2YAXka2+xAu6nUcrtiYQBsyIqPeXZwdv8taQY/VcWfU
         +/o4UjKyod7RNCbFrCorwBs2Xb8wtAWN58Y3OJs8GTB1JLHLxQpbZ/ZIZhXfgHY9LuS8
         0GDyawdeXdtdtQNsBSyrE1DjpqLo6iXjGqxwLTfOEtqLgDNh27+cCdM7tFlsWcKj7w5f
         6OLpcrK4KjCy6aS5gpxC/c+/ubWdqT+FJW4zuBpFUwyTNZZ57wNwXDLbFHBPfsgUysl/
         u1Kw==
X-Forwarded-Encrypted: i=1; AJvYcCUZ3obKbcak9ccIQX6z4xhYyEislKX1fJlljrmVE3B8HG/he2SFwZPEVThLPI1xTrbwzsTgjbE8LfXnn+xV@lists.linux.dev
X-Gm-Message-State: AOJu0YxUfQmebuaBx5nBURq3IfrjNLO0sy9wiF4Mhv9CzGwtG9HPyM1A
	eQTygeTe9kZyGMzbwnnG0Vf2buypi2CypNgFioGaVAjbt47FF/YnO2Ab
X-Gm-Gg: ASbGncuNgOsT9Jp4VOtq2bUZoM5z2irmOeiYZEYQQtOG4MW/5G7VvxZX8Pzvt15NFd4
	4k7DB1P/LYxP+EDrS1JAy9IeF0/nxILhFqBIjuiF9wPWIrqpHnMOq4r8N8mhMPq2j/tsnAryc4k
	Ky8d1VUy8UNYdj6YPAnj8Pi7uDaeMtoUrJDkDGodAAmuclSyAosnA5yWdu0Oyu3nG60ZV3Jtex2
	s4oXXqQEskNkG8HmJv87MqO8W1DSdLjKmEj5o2cgbhSDbianJkhX2vCtVXqSPcSYSEbnybcfGKv
	HqraH7ctOtA0Euw/z6eg1zJbA7FB9FmQ0A7k9p5v+60nk9qOnfgMt55lCErsQ5Unmix9Ali1ufH
	1yP4XxiOoLwddC/0sN6qrNd6DjRp0ngxNIr0DAJ7Hnri2VNrMG98FIeGk0IvciJwW6LjRBwKwyA
	mCsYLiXxyPJ/RI8wdI
X-Google-Smtp-Source: AGHT+IFurLDdacYdLM4BSxhW0Qk0EwyuqedNG4+69GtPIYfgB+zhAdyM8uI7YczL2cY11kRPqkuO1w==
X-Received: by 2002:a05:600c:4f4c:b0:477:7f4a:44a8 with SMTP id 5b1f17b1804b1-4777f4a4945mr48804065e9.29.1762854339326;
        Tue, 11 Nov 2025 01:45:39 -0800 (PST)
Received: from egonzo (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4775cd45466sm359537865e9.0.2025.11.11.01.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 01:45:39 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: johan@kernel.org,
	Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH V2 09/10] gpib: Add gpib build menu and rule to drivers
Date: Tue, 11 Nov 2025 10:45:11 +0100
Message-ID: <20251111094512.6411-10-dpenkler@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251111094512.6411-1-dpenkler@gmail.com>
References: <20251111094512.6411-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To complete destaging the gpib drivers add the gpib Kconfig menu and
Makefile build rule. The gpib Kconfig menu has been added just after
the related comedi drivers.

Add  sourcing of the gpib Kconfig menu to the main drivers Kconfig file.
Add the gpib build rule to the main drivers Makefile.

Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/Kconfig  | 2 ++
 drivers/Makefile | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/Kconfig b/drivers/Kconfig
index 4915a63866b0..01602581b880 100644
--- a/drivers/Kconfig
+++ b/drivers/Kconfig
@@ -161,6 +161,8 @@ source "drivers/greybus/Kconfig"
 
 source "drivers/comedi/Kconfig"
 
+source "drivers/gpib/Kconfig"
+
 source "drivers/staging/Kconfig"
 
 source "drivers/platform/Kconfig"
diff --git a/drivers/Makefile b/drivers/Makefile
index 8e1ffa4358d5..d275b1526cdd 100644
--- a/drivers/Makefile
+++ b/drivers/Makefile
@@ -150,6 +150,7 @@ obj-$(CONFIG_VHOST_IOTLB)	+= vhost/
 obj-$(CONFIG_VHOST)		+= vhost/
 obj-$(CONFIG_GREYBUS)		+= greybus/
 obj-$(CONFIG_COMEDI)		+= comedi/
+obj-$(CONFIG_GPIB)		+= gpib/
 obj-$(CONFIG_STAGING)		+= staging/
 obj-y				+= platform/
 
-- 
2.51.2

