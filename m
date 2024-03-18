Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F01B56B77;
	Mon, 18 Mar 2024 19:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710791656; cv=none; b=QcwX87+wJN2HWJ6/THpICvjKcWD8fdGyTFvmcbHKOGIQ9TPIcxz2U9pktA7+E/r8bhI6u7Kh9f+85ZmrMfv0e2sgNJaKgUuP9HgEJfl/bTnW+IiHuMz5GxIFjc1WaKcjhX8El8LaCtU45WicaRCFuRKwadV+Ih4jQyjFq9vhxsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710791656; c=relaxed/simple;
	bh=mtH10iBGfkgYna2G5tfTnlI8rWUj8bY1rkzj3C1aYYo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GuitJ7p8JH4puuwJxFx08zdWXtX+1FkKMjqoVaStetZxKBjMNIxw+J2mZkxYt5J1jWUvjoRSn2KTVEVeHKKnfHwmhbhS0ZRmMdJ8bVhlcWAqR8Dwn7U/FWqDB3WZ4BHQlweW/TpIRVFgbMG4ONxxaiF0XMFHuw9wCXksXBZOxl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cJyFKWQc; arc=none smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cJyFKWQc"
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-5a47a9f7755so1992268eaf.0;
        Mon, 18 Mar 2024 12:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710791653; x=1711396453; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y1flyVzcCsetu9NnMLrvXhAj5dUurHhoT3CHQTlJfpY=;
        b=cJyFKWQcM4HjPUGEK6HKKgOZSvYELRl1i9PrJKOGdH9IG4PBCZ2j3k7n3TJgv9vuwt
         vFaIr5oWmt2GAsdr2WoEy9Ao164Tkn+E+1HcgJgKcpZUZK+sorjqSSwcclzLh/QTtvvd
         XtiK70ptWL3MDhSlvuks1LO4Z775dpzc/6TcOjO/2bcYy1VX3d00aAQ+M2w14rNAFjdF
         pQA/xUGF6sueQ379D9lJrzDqEKqpWrzJGgfeAEpubv+Ffn1ZVx4hyGvHolVB71lvd07O
         nw308RDG3SyDLHxR8m3oe47kcgfR2rVhor3xGZmz6faMG9C5BE3yrYRzjlyKT8TwPygN
         QNsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710791653; x=1711396453;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y1flyVzcCsetu9NnMLrvXhAj5dUurHhoT3CHQTlJfpY=;
        b=TCywMczdB6NHNJapMLcoFDuNeonzn5+yQSizofTh8NYI6QI8ew7Rup2keHsTDTIy7u
         BOlHdqAWR5w0ha2HcG8nnaI5wZivL9UPMU1O8NMSqi5kTOI+sjIff9q2V4wXGlAJeCUn
         Pm7hjB+6hFhF0GBwBshuFUSIQUI/UMZ9TI1j3Q3QETNhHcYSXMEQJr21NK+e4wc5Fc/Z
         0fHcEf+dXJUZJ4IvRKSAeR8vwikb24mGwY3njvs88gTb/nc3vb4HGTVAlza7Ty0zE8NA
         hgvhdgfC9vqbZ9gyfMiI1D2peXZBmtVRm4QiPqSS76v4NwwCwCxYHrdSnmP/ItEw2cTx
         f6kw==
X-Forwarded-Encrypted: i=1; AJvYcCUXPLrZbZt5jOzeDaYphX5BJXXKX9d5QCv2ZTIHAvAoZDmNWGaPx7jcuV00hMeSycihh5CPv7dXUlOvzPa7gk087XcopUS3filkeg/hIg==
X-Gm-Message-State: AOJu0Yzdxr6qBHSKgFh10vx+dGE4MF2IsdS530wT2Z5zL8atP4ySysXM
	ZuqjpZyVzB8CRL80kpcj2EawMrBJ4yrRwqTO+/SKScBEUgALEvn7AAUctHydHmQ=
X-Google-Smtp-Source: AGHT+IGbiu9tU1tVXEcAIkUX6PVrEvdtAe8aYJQQQVayeZ/o0UATixwN7ebHXpAK8s+vohROKCqzOQ==
X-Received: by 2002:a05:6358:7e92:b0:17c:1e63:d02e with SMTP id o18-20020a0563587e9200b0017c1e63d02emr16325655rwn.2.1710791653519;
        Mon, 18 Mar 2024 12:54:13 -0700 (PDT)
Received: from ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx ([103.6.158.68])
        by smtp.gmail.com with ESMTPSA id d14-20020a63d70e000000b005dc36761ad1sm7744927pgg.33.2024.03.18.12.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 12:54:13 -0700 (PDT)
Date: Tue, 19 Mar 2024 01:24:09 +0530
From: Ayush Tiwari <ayushtiw0110@gmail.com>
To: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: outreachy@lists.linux.dev
Subject: [PATCH v2 0/3] Trivial code cleanup patches
Message-ID: <cover.1710703217.git.ayushtiw0110@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20240318195409.Lb7Rv_iZhY6mqxQ8biUFi_tu3-1gHIc8Q1RU2o-4Ixw@z>

Address different kinds of checkpatch complains for the rtl8712 module
to ensure adherence to coding style guidelines.

Changes in v2: Checked any possible reuse of backup_PMKID_list 
manually and rebuilt, rebooted the kernel and loaded the driver 
with modprobe. 

Ayush Tiwari (3):
  staging: rtl8712: rename backupPMKIDList to backup_PMKID_list
  staging: rtl8712: rename backupPMKIDIndex to backup_PMKID_index
  staging: rtl8712: rename backupTKIPCountermeasure to
    backup_TKIP_countermeasure

 drivers/staging/rtl8712/mlme_linux.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

-- 
2.40.1

