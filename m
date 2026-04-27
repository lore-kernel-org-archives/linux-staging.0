Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283473B19D9
	for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 09:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777282123; cv=none; b=DV500c/FKOrZsRVdaA83OA0j73ykGiiUw2VH20IZwsX+67r7KaBTJCi2LKBVPKziU2MxemOM+dABckgC6bHTpOVGCzt8ErEvtZTIJ0j9OMvtjbnl0QiroOpyKeHDzbm2MF6kTmHtfAjXQaHC4VUorCfsT0aLYNw8jSLZumQpZFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777282123; c=relaxed/simple;
	bh=cWlCOFhZcpalfl3WjAaLRxx9ew6UD/guyBxJt7n25L4=;
	h=Message-ID:Date:Content-Type:MIME-Version:From:To:Cc:Subject:
	 In-Reply-To:References; b=mGMPCOfhxPvUJcsE+hjQRUJmfheCau89+Mi4aOIDAFoR2wE3IRHY7khFU7YPjrKUtcsQS8KRJ7ZGHsOaTofQE2o4bsRE4N1jGr+/t0eFGFJiPeFOsbm5/hHeL4252ULmjHs77AxTbxveAliEhgjPem5pa//Cz+veJj82RqMSJtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pCItr6ar; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pCItr6ar"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43cfd1f9fd1so6147341f8f.3
        for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 02:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777282120; x=1777886920; darn=lists.linux.dev;
        h=references:in-reply-to:subject:cc:to:from:content-transfer-encoding
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nnc/PUQBSU6rmjuW9Girol1kceDL3q32jW2r6UBTf7U=;
        b=pCItr6arx8V6Qu8+Kdd+E609Q6MRSDfK1Z9p2b/ynQomdmuV+q4gv9C3PLILgPOgKg
         MHi5LTmg5bfo2G7aZKIgqlAsQiu25fDGXd/V91vo2HZcaTCi1uS3VmtfpvqQbUPL/bx/
         2+1PLvP5hoEd18GXJuTpjgsra+LdWI0d4t12jp+9vwHA5fcX9lECLzgvsCYPcEbX5B68
         KGFPhx3IM5LZrgcPJPlcSu0TyEqHZHQ4MRGaFGYLFUVDvQSQSyaAtTTqQi+HWUxgLRv0
         E94DQEBVy5yCItDamCeVuyVO51y+ARngaNjkIBjas6M6T8jf/x3GH6xOOXySX5dNa2xi
         8a+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777282120; x=1777886920;
        h=references:in-reply-to:subject:cc:to:from:content-transfer-encoding
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nnc/PUQBSU6rmjuW9Girol1kceDL3q32jW2r6UBTf7U=;
        b=j5pgp9gbFkWr1tDSf8SFmac2i44sxJ8jDZ276hpzv5J/WnMGklnW0pH3LwGawAbWt4
         ALaUwP3769zdGAD3q6TRg1QMRPawmcSZc8eMoYobYEj5Uc5i9STl5ydtwXRtm8lVDe5c
         rurPxhnVKhn1VNdKFtZ2gY18brat+LZaNwn4oaCdqa5wDmaYlAj9Cg4sXPQbuEJNh4aV
         8cyuxNQ15wrRpQNkYXSrLN2HmW+lbN7/rcdTWHjRqhqfuRjfPvb7EA6lnvSGNF+mvEaB
         UVXnphr5GJDfXonj8s+n87ssgcvaozU+wOkdQXY7xvyPLwcAY5XOCzvkNLrTb65e0GF6
         r18Q==
X-Forwarded-Encrypted: i=1; AFNElJ+Gd7YZ2TzBxBk9t90iD9RVgzf+ceY87B00iTtnMmXteOhX+DF9YBCCnmtaMwTKUPgVR1CC4J3lkxgZKX0K@lists.linux.dev
X-Gm-Message-State: AOJu0YzkQpwE+pFCcHjb/zADNEI9rUDWwjw91SbA84XqMIiQrEDskqwL
	ir68Pqye0M9UYNvPttsdXPaFrYACtcaLxDxco1uV1b9vP4/mWixut3oW
X-Gm-Gg: AeBDievJPVKOwX1PPuYf4ENWM0Z/NvF5lGIQUsaoj8ovohgeocygF9OZpWpgvC9MT04
	nTsWKjKjWWDEs+Ep2VUjwYuVO5J1Ao/6aueXPhF6JYHT2DHMfbwcgLRpe+75y5vvR7Nht8OB21D
	mbFT/4NwJT9MHuRkHfoKHeYk+/d9qG/p7klmco6w42J/Pt8KVNo7bTvSIVfY5I2oXw5T39NrHAs
	K4OAFAe+3nSB/GkywCP0I8qioaWpL7Pcf3YIqViqDmQTLcrBRhuhD8eaA9q9aWz94XZvgepcmUe
	DrICxnpe2yvm0pbgSA42J5tQzIaewHUnLmrxBRSyMlMeYRAtyh4J+r3ckp9XbaErjQso1bG1+wD
	Hjm9T1F7bagefvUt6EiE2VIUfv+8y3lLbdpgx9a/llLoT37dgpAE0LYg3SAvCumolLGEtlsoaeX
	TK2xuNwrV4PUMD9r1WMg0yrrmDa5Z10DEhM2J/pNdVfrPZeVn7F+bajZWRkFUHAqxaGBDwodpU4
	+F1BFpzm8GGZ1dubSPe16aOOXSEUCTaS/wOJBqlcgrfY+DDTd5hd+ZDEUjOH5VrCY4ErII=
X-Received: by 2002:a05:6000:2508:b0:43d:71f4:7ecf with SMTP id ffacd0b85a97d-43fe3e1131cmr63955799f8f.38.1777282120103;
        Mon, 27 Apr 2026 02:28:40 -0700 (PDT)
Received: from ahossu.localdomain ([82.78.232.184])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4412150a071sm42776641f8f.21.2026.04.27.02.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 02:28:39 -0700 (PDT)
Message-ID: <69ef2c47.5d0a0220.2e33d8.bde8@mx.google.com>
Date: Mon, 27 Apr 2026 02:28:39 -0700 (PDT)
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: Dan Carpenter <error27@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, luka.gejak@linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/2] staging: rtl8723bs: fix OOB write in HT_caps_handler()
In-Reply-To: <ae8pq5YzEe2wTJmx@stanley.mountain>
References: <20260427081748.3407939-1-hossu.alexandru@gmail.com> <20260427081748.3407939-2-hossu.alexandru@gmail.com> <ae8pq5YzEe2wTJmx@stanley.mountain>

On Mon, Apr 27, 2026 at 11:17 AM, Dan Carpenter wrote:
> We need a little change log here.  I was hoping you would provide
> a link to the AI review in the changelog.

Hi Dan,

Sorry about the missing changelog, will add it in v3.

For the AI review link, I don't have a direct link to the bot output. What I know is from Greg's reply in the v1 thread on lore.kernel.org, where he said both his fix and mine would break things on some systems according to the review bot and asked me to use truncation instead. I went with min_t() specifically because he asked for it.

You're right that technically early return would have been strictly better than the original, the original was already writing out of bounds so it wasn't working to begin with. But since Greg asked for truncation I kept it that way.

Thank you.

Alexandru
