Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF02130E46
	for <linux-staging@lists.linux.dev>; Thu, 28 Mar 2024 18:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711649008; cv=none; b=Rb2kfLSzNfsuE89FTXdOIpaiTfAHQV7vHdpPsXV7hXG7APUndgQB2wERSTnqCUUmtQ0B8pJ9Prdj+1S0U4wwaW7gBOwzFddDFke2mCP8Ra0884yNK0KOp6OCjuDos95rCRRIOL0I0P1G7wYg2+n357e34XFw4swjQ8SkqaD76Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711649008; c=relaxed/simple;
	bh=vB1K3UeOU2FvgT3cwFX6bIQzHZMdAnkhCLXgIqkAx/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FbOw8XRr/uUoq1XyqT92TUGozdvUVjvrI5qDf8CSs/PkJstqeMw8gbiLTUn17hUIN02+6QKPlxBInFaumPLuEGpynWD4XGzWn2eedcUdjhsjoh3/NcQQ+mkiQWONBiTQaqkN4yBOHP6PFJORKq5BHeSIOp6OMFuxxF/qLu3Uki8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YvWJmQBT; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YvWJmQBT"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1e2178b2cf2so8202295ad.0
        for <linux-staging@lists.linux.dev>; Thu, 28 Mar 2024 11:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711649007; x=1712253807; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=olSW0jWLIrC4vxY5yG21bb3i0NkpMQDJhW3rhvvrLzQ=;
        b=YvWJmQBT2ialLArZAzEXLV1BsZXQVNLsS33MFmUvVFhJvwO4CxjAuqZUl7IDEorJDH
         zpSxGWbFsMmmCacIUI8UeCPisxl213UpbFf1jsK8ApjS5WLTaQC1yOrtdsOB6Co2qeMn
         SORCB/Is1pUnBptL95PqcK3s7jU+Gx/bIa6G0BN3Xwx7wtosQXB6N2P3+f3wxBqU3PLv
         97pQThN6QzSmPZOmZGMbJEqTzSgLPeB7dshjcI4fiJ0G/K/aAIXvuVXahyZoDbJGKpbj
         Szg0wS0ce66vU9l1eUbsuDQ5wUU1Nr2GqJT/W0to/IrVbzZNKjPdTlL4X5LKyqtcZ9mc
         pC0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711649007; x=1712253807;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=olSW0jWLIrC4vxY5yG21bb3i0NkpMQDJhW3rhvvrLzQ=;
        b=xJi6JbLGo6QkUy7AO+47bx99Axl4RKS3zkVsuYjQv6+H+OYdjy1xjL1h6SE7YA24wE
         6cfDrS9ZJYFvRVlRUVWc9Tb/DdqgpsQ4Qy2dMc5v7SE2v0Htqhz8SjuusPlGYmgkbBHq
         s96UD2fnib6jWW+TH0tF3Iap/te7gYrTM5I0n0oN4NJkor5jkQhtFRLFP8nv3Ubutgw3
         8MQuE88idb82i6OVNDHPPrsna5t7i6utEAz9I6alI0XEA380FrjQRbasRyMsvUxtBAHZ
         OAov7YCo8WmpbzzxEfbT+VaLClFtv2gS6JRfi80Be/x4OYZORGm17jiM9dEEHucIhQMs
         UrPQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0qCAcnvStz1073hxNPTfeuXKppdhNgjqFg/zDl/GnG53F9BuFUDgaTIzyy22zqqc/1xcSXbhtayoTCiQxY/JRzaYBP5pqV0v8eLMOCg==
X-Gm-Message-State: AOJu0YwSXVtPFH48k5/pRK1DF08CjIbnEHG9TDpWsmzvmfy1jmXwKQl3
	VoZnq4HCMZnxEBV7Hcqpa1r1cWMA0B/9ja9w6eCm27EliUtpfH1v
X-Google-Smtp-Source: AGHT+IEkQsFT2CQ41glFYLpP1d3wFQ1n1mHU48V+X330fVWYW26kggF6SGZ6JUFwxozMX9FKu+ROTw==
X-Received: by 2002:a17:902:ef48:b0:1e0:e2b1:7395 with SMTP id e8-20020a170902ef4800b001e0e2b17395mr283743plx.14.1711649006562;
        Thu, 28 Mar 2024 11:03:26 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:493e:82a3:49f9:d88])
        by smtp.gmail.com with ESMTPSA id mm8-20020a1709030a0800b001e12013ae07sm1901205plb.231.2024.03.28.11.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 11:03:26 -0700 (PDT)
Date: Thu, 28 Mar 2024 11:03:23 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: David Lechner <dlechner@baylibre.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Support Opensource <support.opensource@diasemi.com>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-input@vger.kernel.org
Subject: Re: [PATCH RFC 1/7] regulator: devres: add APIs for reference
 supplies
Message-ID: <ZgWw66OpLnLPdCn-@google.com>
References: <20240327-regulator-get-enable-get-votlage-v1-0-5f4517faa059@baylibre.com>
 <20240327-regulator-get-enable-get-votlage-v1-1-5f4517faa059@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240327-regulator-get-enable-get-votlage-v1-1-5f4517faa059@baylibre.com>

On Wed, Mar 27, 2024 at 06:18:50PM -0500, David Lechner wrote:
> A common use case for regulators is to supply a reference voltage to an
> analog input or output device. This adds two new devres APIs to get,
> enable, and get the voltage in a single call. This allows eliminating
> boilerplate code in drivers that use reference supplies in this way.
> 
> devm_regulator_get_enable_get_voltage() is intended for cases where the
> supply is required to provide an external reference voltage.
> 
> devm_regulator_get_optional_enable_get_voltage() is intended for cases
> where the supply is optional and device typically uses an internal
> reference voltage if the supply is not available.

So because we decided that we could not have devm_regulator_enable()
because of (IMO) contrived example of someone totally mixing up the devm
and non-devm APIs we now have to make more and more devm- variants
simply because we do not have access to the regulator structure with
devm_regulator_get_enable() and so all normal APIs are not available.

This is quite bad honestly. Mark, could we please reverse this
shortsighted decision and have normal devm_regulator_enable() operating
on a regulator?

Thanks.

-- 
Dmitry
