Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B4C357A46
	for <linux-staging@lists.linux.dev>; Tue, 16 Dec 2025 14:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765894117; cv=none; b=RNgzdv3PIn+tqk4gxlYLg7F57MjVouyG9zZoi9dMN60dV2nai8h+lx3qc3GrU+DplbLKhaJRUuaPJfePDlo6oLueQ4pyXc22YQPiClU7v438wwvk0eijYLFIESVkNJsAjXc9WDqVMtqeHUWw8WAoC0yIzGvRI3ebcUruytQYxIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765894117; c=relaxed/simple;
	bh=9rFMb124gT4wX6Z1BaKIkp+YpYgVU36olQWt2ZjruHY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eBy4sc4KPawElU+N1NnZwdgshffJ1q/q5PftpqyQ1XarOJvErst/mpGbf/NY1XAOG+klU5ELQEy+kSDKuCOn/T6q3U2jEeIxpl+2i39p5WPSl+EmqgbIwXa5gYXvLYxu9eHKsctyh3LG4ynnojlH1AgdwOSS8252q4A4/duEiq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G0FnFTQA; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G0FnFTQA"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2ae24015dc0so2467213eec.1
        for <linux-staging@lists.linux.dev>; Tue, 16 Dec 2025 06:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765894115; x=1766498915; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ABDSVD0OZRkLhpM7GVbSEPZkovu4lepBLS40gdoYZS4=;
        b=G0FnFTQARW6YekBS7GQS2SF7b6ttn3avYUQ2sN6FOymvwZH08X9Y+x71AqEnIV7EIZ
         OJ4o/0Xq+5uXHQJoYJ03NczQRP9FRIy/2NWCT9klo20thnLOmcBEuPB9VxupJeqK8AO+
         s63k4/xvuF7FgGXELF6OEL5SEP86MwqQqteZ7eH+KswTZH2l2yA9Yyf7vYCTp+FY/zt5
         m7MyBPAkpU6A55eXeWiIUv2cUAYzWgn89TOxheMVWyHjRNfCs51c5FK8yihnJuCBWSOG
         CyFzAHLaVVG/ybOnqulhJDpukQ8YCTl1JjThbd1MnAUEuHBchCuKU7UWjxkqTVi2UcC0
         db6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765894115; x=1766498915;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ABDSVD0OZRkLhpM7GVbSEPZkovu4lepBLS40gdoYZS4=;
        b=Zs9KXPbUO5+AIvKNo2bvqslLU8Xc6wEQBJNIFzAxxgEHxU0ZnKp9Bk1vSxIB57qYy7
         zSrlJY+QQk0ycq6WqT0ULF/3O/4FTGdXQ1/ztZQYL9s275qG9cO6S4MvqQuRFVoXE+La
         0TI/JPd2Mh681TFN/NirZYpvHWnba/mRFKrF8VO2+n1lIQsvDKeLQ0SRA54yhnn7opYJ
         safaRCcekyHvbMHuvMTnl6tHm/cPOulXuOCOEut/L2ijEO4Pm+HwDyO9+/ECcRtlQnPo
         lMn1Qz9xWGJBejPThglBFz/yKHWYSo7glISMWYfN6uL7kLBznyQ/AfSuw/LJBImv3Ek+
         p1cQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxhm5bUzVywRgZfwDCu3HBXhpSn7Z98CDPo3En3GCFVDR6o0mRLtXSZ36n3JSfDj+V4e5kzdBhbH+MIw2M@lists.linux.dev
X-Gm-Message-State: AOJu0YyHZdv4XbHiP2KYoPutG2Rp2rODcB92HTDiQybnT+uNfKchr+Jp
	+F77/kj4RrIVjS3OU/9YKn//JndaPTIx5a5jbLTwYTF0iGPnnGfRYskE
X-Gm-Gg: AY/fxX4gMtJ1n0ATog3rwI2rWZJQy/jpR72tjmvEkT2AY7GdqpggzWw1K29R8fRGCPs
	VCeXXg6bBzsFgTZqNKoweQY3jSeUSql49hnO5Q0PVPff0aRj9rperTEvRheBx3Rvl6fu2LouCe+
	Vz+sLagWNrYpEAAHeOyJ4cwM/Hr4e5mSrEDpK8pn1bBD68NBDFCBOJQFnIcKUkHcSznVtspIKrN
	IS26llDkWYilZjN0V/1M1H8kKy2IZbyRyE+Os4DeITri5b/BwUSegWnL7pfKbgV3a/NuJuVYd0z
	M9f5cIyOSrC03CYbMW1D5PHT4Z1ICDxQY8n9Mc+jsPkY3Hv27SXGgjirb+Bo1IJMP5dtKa23jk/
	r3SGZXioZNZ8cBF+0zGUM1CGynZIIwbCRmHtuAyZXqNarU2IJW6Nes9EWHsObp3xjzsFzo0/Qf0
	zrbhKMCuHJGsmHVTBkZfE=
X-Google-Smtp-Source: AGHT+IHut++cYKFHRhXb1H/jKXX0lEIBo0qPaxV41c3ukUPyZmolgjjJxKIEBV8l7YzJaRod0zxYeQ==
X-Received: by 2002:a05:7301:92c:b0:2a4:50c2:a74c with SMTP id 5a478bee46e88-2ac1c5e0f00mr8160301eec.8.1765894115073;
        Tue, 16 Dec 2025 06:08:35 -0800 (PST)
Received: from localhost ([2804:30c:165b:7000:d59:b973:da75:f845])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-2ac190acd01sm39890645eec.1.2025.12.16.06.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 06:08:34 -0800 (PST)
Date: Tue, 16 Dec 2025 11:10:13 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: Tomas Borquez <tomasborquez13@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [RFC PATCH 3/3] dt-bindings: iio: add analog devices
 ad9832/ad9835
Message-ID: <aUFoRVjoB7BHPTRN@debian-BULLSEYE-live-builder-AMD64>
References: <20251205202743.10530-1-tomasborquez13@gmail.com>
 <20251205202743.10530-4-tomasborquez13@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251205202743.10530-4-tomasborquez13@gmail.com>

Hi Tomas,

Overall, the dt doc looks good to me.
In addition to comments from other reviewers, I have one suggestion related to
the SPI mode.

On 12/05, Tomas Borquez wrote:
> Add devicetree binding documentation for the AD9832 and AD9835
> Digital Synthesizer chips.
> 
> Signed-off-by: Tomas Borquez <tomasborquez13@gmail.com>
> ---
>  .../bindings/iio/frequency/adi,ad9832.yaml    | 65 +++++++++++++++++++
>  1 file changed, 65 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/frequency/adi,ad9832.yaml
> 
> diff --git a/Documentation/devicetree/bindings/iio/frequency/adi,ad9832.yaml b/Documentation/devicetree/bindings/iio/frequency/adi,ad9832.yaml
> new file mode 100644
> index 0000000000..f14e054ab2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/frequency/adi,ad9832.yaml
> @@ -0,0 +1,65 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/iio/frequency/adi,ad9832.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Analog Devices AD9832/AD9835 Direct Digital Synthesizer
> +
> +maintainers:
> +  - Michael Hennerich <michael.hennerich@analog.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - adi,ad9832
> +      - adi,ad9835
> +
> +  reg:
> +    maxItems: 1
> +
> +  spi-max-frequency:
> +    maximum: 20000000
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    const: mclk
> +
> +  avdd-supply:
> +    description: Analog power supply.
> +
> +  dvdd-supply:
> +    description: Digital power supply.
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - avdd-supply
> +  - dvdd-supply
> +
> +allOf:
> +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
Specify that the device operates either in SPI mode 1 or SPI mode 2.
See [1, 2, 3] for reference.
  - oneOf:
      - required: [spi-cpha]
        properties:
          spi-cpol: false
      - required: [spi-cpol]
        properties:
          spi-cpha: false

[1]: https://www.analog.com/en/resources/app-notes/an-1248.html
[2]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/spi/spi-summary.rst?h=v6.19-rc1
[3]: https://youtu.be/MV8Sy6jGUIE?t=611

> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    spi {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        dds@0 {
> +            compatible = "adi,ad9832";
> +            reg = <0>;
> +            spi-max-frequency = <20000000>;

            spi-cpha;

> +            clocks = <&dds_clk>;
> +            clock-names = "mclk";
> +            avdd-supply = <&avdd_reg>;
> +            dvdd-supply = <&dvdd_reg>;
> +        };
> +    };
> +...
> -- 
> 2.43.0
> 
> 
