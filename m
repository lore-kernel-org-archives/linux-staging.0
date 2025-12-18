Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB223328E2
	for <linux-staging@lists.linux.dev>; Thu, 18 Dec 2025 15:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766070522; cv=none; b=eMeOSLtHGnA1LOdAs4F0EXpDiJcNhnpuDcRqzVljHjIn5/UrcQ6wwn/qnlODnJN8wgeLDkiDaI7pv8oRoVgTlTlX4La3Hn1dBzQMwfZW56+mSboFDjNG1RjHJ3iO+BM/3iy50INuDEoqZRE9zscqlMhqWXlI0bvmqr5eJTeMLSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766070522; c=relaxed/simple;
	bh=dG9BHkSmtvEZ5opsdi0zlbOpuH7wYROee/KrGE0p6dY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VPvjnZlFqmb/jtSptOQVzoFTjMdiHODPAwnZpqqMgM6Wh0Hqk3qdFTJeP2GeJUM4ozKCKDh6U30xN5/jK0ZmHH/UhSrM65T2ik2RN6B2x79cRQQNXV2QumUlmIezsdXdBy6tPygtWS/ZsoHWRVaMaJTx0FmdSnpzhrj/ozINoAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I78/+XPz; arc=none smtp.client-ip=209.85.215.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I78/+XPz"
Received: by mail-pg1-f193.google.com with SMTP id 41be03b00d2f7-b98983bae80so673618a12.0
        for <linux-staging@lists.linux.dev>; Thu, 18 Dec 2025 07:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766070520; x=1766675320; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oM5Ed6yAJlRPec6L55p1WAYPdXfYMa3dip7n7XOXSAQ=;
        b=I78/+XPzmV903NNdmb5KVAmXcckb0RZTWQZJoZR6yEL76vDW8J7ek9nIdzoUIG56m4
         EKUrQUPnzW0z2F5+JHVBuELVK6LJZgZg3piB+xlWFJXVMTGZeCmFtN7C2zMF0qYUrR2a
         Sc8YAUAQY7HVdYuoE5+EoWh0ag8dmKxcCeQJsU0AihfNdZHWUi3XZ5QOL7TVjIwy7UHY
         d1Nuvuu53lcX+9DfcjGU1D0N0HDufupoEVSm2Si07zVHIvTXqlozwpKEhfwqFcVSH8Ng
         OyjvbVk/h7Sla3H302gyQ5mxKKwY9rulsa8vybKrMyp10iatr6c+Ti8LlXbGMyyLSJJs
         HMTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766070520; x=1766675320;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oM5Ed6yAJlRPec6L55p1WAYPdXfYMa3dip7n7XOXSAQ=;
        b=kB1OWSzKE+5ZpGKSH4IG6jtwPPHVh5jyVEt9QfdiFQy8FFMSIwbp73A92LpVWFyTAO
         ObLVs/gx/eBlif9fcbTAq1MfdQYAD4m9ONiRt2IXyrNk9Uo2IInP3FlzP7F2I5sPAi/K
         E9KsCE2jZ+IzvA3h83vaockxjKE4m3Iy4NkoRki+PqvvkAyZ6sfm75jBIBJt/S61aZnb
         xSh17cYclJkBT3oaf1c9QhReBF9rXVn2lLptaY+716z9AffBBgGk0fB91rVobpVgxarj
         I0lBPhoUw36xdudJ5nFq99kdiLaSmMR4jRiupCArY3qDlpxYt6+aW/7B7JasGFgvIJtG
         RdDg==
X-Forwarded-Encrypted: i=1; AJvYcCUK0752TeOrLyQ05lugGtEkEjfIswIr2GKC3uPic5baYbouTR8G/ZCwCwXJp12MRMHkfMQ+IKtBAFQ7McXe@lists.linux.dev
X-Gm-Message-State: AOJu0YwQdY2zJX331eRa6tgSmDy6vbJgHpnI8q7vSfFfZtsEgt+xQGnG
	akcTSbjHlf7pGogfrv5V9Fk7X+rBIlhG5QdR0ux2fkziTKI+W964iJ4B
X-Gm-Gg: AY/fxX6CcpohhqLh0LZ2ANv5gj+5m9u0LpgPVC6bp62sLNrYUvV60n3wIUWG0Ogh+qW
	KQsu9FOv7quTMcD7X4PAcIRkJSIR/CHaCdiyLpqM9QpSOMfYa50E66K0cGrh3m+k3fzJgtAOcPB
	q5wLiAp/wFK94i4wdSsNYCQzO96UigqiJEql//9mACgd/6sCrKyQxDeaCXZlHUcRn5cUgzT+tJC
	OlBumv8JNG+2fcFNF+84oa32kJHquawmHuI1hTwRSd628AfWQ2LCa6tBczZ6h78D8sdqlti5JE/
	CFIUm+v4dTruNcGH53Ze7TthjJm0WS3Sf7sja570wdy0TvybV4zQccuGd5Sz2fv3j66EGtI0AIo
	ersme8QDAmhzXPNtv72aPE4lYExTXBy2+rzIQq9yGStHlTdxk4Cdd0S1xsnlEhCEotQmOkRGuVq
	0hI0bb/U0uQ17WpNruogE=
X-Google-Smtp-Source: AGHT+IE5702B//DpNe7SVJNLHPzYCxreGWqKSPdmhrv3HDBuK4Aix1Q2FMXA4yfLvlCympXY/u37Sg==
X-Received: by 2002:a05:7300:7b16:b0:2a4:3f9c:9af8 with SMTP id 5a478bee46e88-2ac2f870512mr15965864eec.9.1766070519867;
        Thu, 18 Dec 2025 07:08:39 -0800 (PST)
Received: from localhost ([2804:30c:165b:7000:d59:b973:da75:f845])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b04e58d04asm5133994eec.2.2025.12.18.07.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 07:08:39 -0800 (PST)
Date: Thu, 18 Dec 2025 12:10:19 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: Tomas Borquez <tomasborquez13@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 5/5] staging: iio: ad9832: add sysfs documentation
Message-ID: <aUQZW3XBusWl3TU4@debian-BULLSEYE-live-builder-AMD64>
References: <20251215190806.11003-1-tomasborquez13@gmail.com>
 <20251215190806.11003-6-tomasborquez13@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215190806.11003-6-tomasborquez13@gmail.com>

On 12/15, Tomas Borquez wrote:
> Add sysfs ABI documentation for the AD9832/AD9835 Direct Digital
> Synthesizer chips, documenting frequency, phase, output control,
> and pin control attributes.
> 
> Signed-off-by: Tomas Borquez <tomasborquez13@gmail.com>
> ---
>  .../Documentation/sysfs-bus-iio-dds-ad9832    | 41 +++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 drivers/staging/iio/Documentation/sysfs-bus-iio-dds-ad9832
> 
> diff --git a/drivers/staging/iio/Documentation/sysfs-bus-iio-dds-ad9832 b/drivers/staging/iio/Documentation/sysfs-bus-iio-dds-ad9832
> new file mode 100644
> index 0000000000..5ceea57917
> --- /dev/null
> +++ b/drivers/staging/iio/Documentation/sysfs-bus-iio-dds-ad9832
> @@ -0,0 +1,41 @@
> +What:		/sys/bus/iio/devices/iio:deviceX/out_altcurrent0_frequencyY
To be more generic, I think we could use a capital letter for the channel number
too and avoid the symbol postfix in the this attribute's name.
+What:		/sys/bus/iio/devices/iio:deviceX/out_altcurrentY_frequency

> +KernelVersion:	6.19
> +Contact:	linux-iio@vger.kernel.org
> +Description:
> +    Frequency in Hz for frequency register Y (0-1). The active
> +    frequency register is selected via out_altcurrent0_frequency_symbol.
Maybe, if we can keep only the 'Frequency in Hz for frequency channel Y.' part
of the description, this is something that could actually go into sysfs-bus-iio
when the driver graduates. Though, the 'register is selected via
out_altcurrent0_frequency_symbol' part is trickier since it seems to be design
specific. 

What if we do something like
+What:		/sys/bus/iio/devices/iio:deviceX/out_altcurrentY_frequency_symbolZ
+KernelVersion:	6.19
+Contact:	linux-iio@vger.kernel.org
+Description:
+    Frequency in Hz for symbol Z of frequency Y channel. The active
+    frequency symbol is selected via out_altcurrentY_frequency_symbol.
?

Same thoughts about out_altcurrent0_phaseY.
