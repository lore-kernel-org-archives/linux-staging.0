Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04F22C19F
	for <linux-staging@lists.linux.dev>; Mon, 19 Feb 2024 11:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708341795; cv=none; b=KhLHSa9/Zvkr1uCAu0hhgCGCOKXeVLnqfjYEUNtKdao14bB9Y5jtr+wiMKBXjcIBxFLGJxNW86IT/n78EWUQm6prO9Z9Rc9Zr2H6cCUw1KUNmjUaXAi7kM5idxwLiJJjE848YKDxNfzGDonhrRHHyxvGFzDgcCK7WNwQ+gpQTXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708341795; c=relaxed/simple;
	bh=OhSMZSbqG2+dG7tJMeWV0mIyqHyqbRp3b14eCVIHPp4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MBHG8sAXelyUEWDi5AjEQ7jpMccO9yFaJ4GBy6FBWRDtqWDrAkKmraN1qNAPdri+nXCoLh2AFXSlCyou2xW5lu/jTyr028yRg0JCSME8h3nJiB0gVkgnbyz0Ip5bxs3/8pyLSy98lpnbAT6KplOZ/k/03HBDoZQD+VeWLwDgQ7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EhKaFIYY; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EhKaFIYY"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a3e91993d73so121305566b.3
        for <linux-staging@lists.linux.dev>; Mon, 19 Feb 2024 03:23:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708341792; x=1708946592; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yxy8D8aTsjXwHxlAaH9IbSuI4bH2UUXck9m7FNE/P/w=;
        b=EhKaFIYYlR8lPzxzxCZN2H1IkJD1KB/0af2zTAgst7A+QiIdRKT2h6KffqkCJAQS0a
         QvxMSzcjVI4ONbXLfvXUMiOfMqzQqSVJBIwuyjLvoH5Vv45fecsJhsuqmCPPxBMF+Zee
         3AYaA7kCpxRj9hnoEF6+zzmceeuoY/UWhGL/bYD6vaHE5zmhQ0GiNZMjYruaCzGjlUqC
         8lUhekLyKi0rc8db/6xGcN9aIubmZeTKKieAgAh7NK5UWx9cKvnCJh3uRa1Aq6mSs33r
         74TnSu23e0FIEufpnMLRvYHs6NN40NceNXhYkY8wD0fLv8ZUrY6RBtnMUnjVCbdP4JT+
         SZTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708341792; x=1708946592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yxy8D8aTsjXwHxlAaH9IbSuI4bH2UUXck9m7FNE/P/w=;
        b=xRj8Wh0eMaXLJzBqNMKfkkHLLiGQFCQya/L9I0Uwuqdep2eXP82zzVzQIb3ZKXEumU
         sd/fIo9tCAGFX8W0Hgn0mjFV6RhFsObazZQCGL3AdoXj8HU0XrKIAmIt60mxdjLwfVd2
         NqLXwRjNHfp2PhwodnYMFpe4rqoE7SC6g6Z0rmDOgPh29qJS3DIiX8kIJC71u7c+YXwB
         7ECqT9uSqflBjxX8QsQifcQeZVVGx10R9jVpZkunqnmDSnOOckG252WCQqs0xURmWNUZ
         GtGDtPLTkK+1C1+f9+z6oxAKpiCX9HBrJpylGTVEn8Uf++Z6rcAQFbQ1llC100bt1IgW
         vuzg==
X-Gm-Message-State: AOJu0Yy/xWK3Mu98066PSg6T+j1zoHfNYFM86zeKrK05XVPDKECalsDk
	CNcAFGFLkTrmLz3gFbS1CzA36Mcb796+dCQikg/l1gRytYU3P0Ez7wfzGX9X
X-Google-Smtp-Source: AGHT+IFrLVkQX4NonWzI1LnBhJ46XoGwDP0asxttWvhtZt3Sb+YSrDJSw9AE6SEm24esO76lWNkESg==
X-Received: by 2002:a17:906:f206:b0:a3e:39f7:52b4 with SMTP id gt6-20020a170906f20600b00a3e39f752b4mr3464574ejb.49.1708341791821;
        Mon, 19 Feb 2024 03:23:11 -0800 (PST)
Received: from pinguine.lan (ip-176-198-146-182.um43.pools.vodafone-ip.de. [176.198.146.182])
        by smtp.gmail.com with ESMTPSA id ti12-20020a170907c20c00b00a3d581658bfsm2826495ejc.24.2024.02.19.03.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 03:23:11 -0800 (PST)
From: "Moritz C. Weber" <mo.c.weber@gmail.com>
To: florian.fainelli@broadcom.com
Cc: linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"Moritz C. Weber" <mo.c.weber@gmail.com>
Subject: [PATCH v3 0/2] Staging: vc04_services: bcm2835-camera: Fix code style checks
Date: Mon, 19 Feb 2024 12:22:32 +0100
Message-Id: <20240219112234.8673-1-mo.c.weber@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <236d985c-1835-410f-b0b5-cacbd5fbf930@moroto.mountain>
References: <236d985c-1835-410f-b0b5-cacbd5fbf930@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Resubmit these patches to address comments to rebase the 8 v2 changes into
2 patches topicwise
Fix patches with same subject issue based on v2, which fixes multiple code
style checks for better readability, consistency, and fixes typos from v1

Moritz C. Weber (2):
  Staging: vc04_services: bcm2835-camera: fix blank line style check
  Staging: vc04_services: bcm2835-camera: fix brace code style check

 .../bcm2835-camera/bcm2835-camera.c           | 61 +++++++++----------
 1 file changed, 28 insertions(+), 33 deletions(-)

-- 
2.30.2

