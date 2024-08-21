Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C380214C5AE
	for <linux-staging@lists.linux.dev>; Wed, 21 Aug 2024 18:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724264535; cv=none; b=rkDmtIb5jpxCQN015NKmqBdF/k+lacql+59/ohXEzh8ED2dLq1Qw02oATSApT1yLx9t8xWi4BdbV12ZRwZuLxD1G2LKhY6lRH/AW9gpe3pmJr8+RCjZZwx73vW0QEGa3AJpKCVQPzBKl5edwWKEtDFcwtx4QrCey0hjl8/7Ci5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724264535; c=relaxed/simple;
	bh=ofGjdtVJIZiLjPOgz/4RTi3L+cafvhVR0TZSBt+kSRk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FloydCPu3UNRv91hj5SHXDJ43N4uAqJ02Ip8UjbZxcg4wtDlmeCcCyxTzGYtUEnWJTviIxJzEhE2cWttN0xvqrrKjtTeleyE5j8FDP5fzocDaRy/+coCqdrv4+zk34tyBRTMxyHS3QNyv2TkeRO44rXpiFwvzy6SoZV6JQ+X0IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x4S4A40S; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x4S4A40S"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-371b015572cso3733138f8f.1
        for <linux-staging@lists.linux.dev>; Wed, 21 Aug 2024 11:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724264532; x=1724869332; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1+EvylzRgMqclEVa6Y9nb3nnjZ20K0PzDm50IGhF7Wk=;
        b=x4S4A40SnlNeyiJa+krAR+od1XPsKVMqfqRiW2no1IV33fkxwCabk3zV2kNST/4Q4P
         vAy1Q1fe20KWowdRt/h74OPRGN3ekkXX75G2xlq6YkZTN2mbDHTS2SC7XTKJQIHki+KY
         COF3OERJ2LLLMCFVTMGoKir1/lLePX5MFN01GIR7iwEy4+oIiEUE7d1DU4nYpNUnmplV
         k8OYcybnkxr+U8oCKhjnBy1eR907xR9poF4hIKGhIoV5EOJ9yLcu3D9nGS9+5w26ttxx
         AaFmdi0xinFaFKSWAAQzPTzimqZHFSHhV0ridluv9krHXBnFQJmopfQORb6f4v3CE+5y
         2fuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724264532; x=1724869332;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1+EvylzRgMqclEVa6Y9nb3nnjZ20K0PzDm50IGhF7Wk=;
        b=TNpqb4zIreV6tabt6YcZa6PDBaYuRivEAsynNO0LcX9+UjTsKAGncSFUF8HbbHfi73
         2v5WUu4SBFHkf/hP09bpN4vp5H1huATNSH80+g6+tpCLM+iKkfO3hAPGtvEK9WDezKOk
         fNkdeSrITF+BP2SjYrgEaBS+jyWJOlSLD+290IznhNS6qD38h2zbSz/hfNisx70jMPad
         eFHOOdqD+nAqsLZ6EpaZHn9U08/odIr6UapOq9Y8ARmIvbFSxUenfbx6Qf9QcSTPqvyI
         Fj/o4CsV/9mMC2ypnaR3wOVSzs6C62M/zZSUirWde59rS34/yz+qaWlh3Ro1ItIQemko
         fcrw==
X-Forwarded-Encrypted: i=1; AJvYcCVEumOcLp4c45j4CiZOqYtV8znDlITY1c4GiQG5T6QWaS8MssHxwGh/an8Y6PaTFkiptqqZoDLxGN9p+LJj@lists.linux.dev
X-Gm-Message-State: AOJu0YyKonNMu9Fn9v5Ja18BpzU5qoTZgzYoPAMsr0MEvSr+TQ23D8L7
	CcH2BeOuPKkduipjDJM/IG5KsvY+jJnO+N7UQI/lsmwQAKHHMEtMlVegRKgUDSE=
X-Google-Smtp-Source: AGHT+IELVgS+H+Ie8TqF+vxzlIUfCOLU9x9LxN780T8l/WKjQpgTUUuHrTucFYyTW7d/n2qVFXgmLg==
X-Received: by 2002:a5d:598b:0:b0:371:869b:4e5e with SMTP id ffacd0b85a97d-372fd57f409mr2961406f8f.1.1724264531988;
        Wed, 21 Aug 2024 11:22:11 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a83838c65f2sm932819566b.29.2024.08.21.11.22.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 11:22:11 -0700 (PDT)
Date: Wed, 21 Aug 2024 21:22:07 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Abhishek Tamboli <abhishektamboli9@gmail.com>
Cc: gregkh@linuxfoundation.org, tdavies@darkphysics.net,
	philipp.g.hortmann@gmail.com, garyrookard@fastmail.org,
	linux-staging@lists.linux.dev, skhan@linuxfoundation.org,
	rbmarliere@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8192e: Replace strcpy with strscpy in
 rtl819x_translate_scan
Message-ID: <5ddb4b56-f78f-4219-8524-cdb2afb3e373@stanley.mountain>
References: <20240820184216.45390-1-abhishektamboli9@gmail.com>
 <b2efc687-07bd-462a-b0a5-58e09bde32a7@stanley.mountain>
 <ZsYoYe+8k0YEyS2U@embed-PC.myguest.virtualbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZsYoYe+8k0YEyS2U@embed-PC.myguest.virtualbox.org>

On Wed, Aug 21, 2024 at 11:18:17PM +0530, Abhishek Tamboli wrote:
> 
> Given this, would it be better to use strcat?
> This would eliminate the need for the pname pointer and align with 
> the current code's method of concatenating the rtllib_modes.

We can't ack the patch until we see it.  Try it out and see if it looks good to
you.

regards,
dan carpenter
