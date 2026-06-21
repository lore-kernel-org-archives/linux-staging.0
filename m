Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E3531F9A3;
	Sun, 21 Jun 2026 18:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782066812; cv=none; b=s0gRSYFRlhrDi8ne5n4nskoSUWB6jJGiSZO9KAeas17mZDvu/qZiML/0M3jXSJ6+fQZj/wuk0pjHcEGPWnpcWsYTQz6CfcFlYeFbhQ/TjHnRAWeuRgZytpEFjhc+RETUJ0t5cEI4uFjvrp/4S6A3bAwX9c7lao5GuChdKnq46eM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782066812; c=relaxed/simple;
	bh=3FugsXkxEslbtweI2XJxKNsiL6MsryNim+h6qdfIGMs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SHvkVtUv/ECdz7dR6H21ZOUYKGXUhZpiSfmxwVuLv6djwnlaiDzpOEitoALOvtxhstCwsGGURfNhwJMJfPQYbMH8LKjyywX2DoySkmnBYzIWcpr03JH7A/hfFh5NakLv/lyy58l8m5df5/4mGn5AtpY8TWsjEIbC2/UoJiucWWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WAWOZ2iY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WAWOZ2iY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EABF1F000E9;
	Sun, 21 Jun 2026 18:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782066811;
	bh=EziEv/DvN6WVCSXgedIQuPY+cjYXhacg2mPWuk99tzY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=WAWOZ2iYaCLwTpez3sDCr33gh6sgidGybvDYhcEDJ9Ljbc9RJvvnD61teEzfdr7Lw
	 DtqqLoW0X8Uv1lqAVvGOXuyWbpIp9VVv+zeJ9a93OXrAIvz5YIY+CdD0BYuMEXbgFb
	 t1KlYXo4RXEhsofiMOFVSXDmQmfxOBczLw3RvvXU2cvxIH4lSSgRGPliA0cyeAgFg/
	 g2dfNGLWyqbx9tU6lRe3zjZKzTkInerl0cZ36bjVxewUAdxwVq2OmJOvr9rU3vd5G1
	 3DunpTl5PnUO6bSJm5gO/COUO5RCCBH9ZGyxxj6SY8wNMaMrzmnGWZMwxtSrHbgdit
	 C6J0v9+zx/oCQ==
Message-ID: <548d66ce-d01e-4c6a-a77e-7d61378a1c74@kernel.org>
Date: Sun, 21 Jun 2026 20:33:24 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] dt-bindings: misc: add binding for Xilinx AXI-Stream
 FIFO
To: Aditya Chari <adi25charis@gmail.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, gregkh@linuxfoundation.org
Cc: jacobsfeder@gmail.com, devicetree@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260621085209.52651-1-adi25charis@gmail.com>
 <20260621094312.53655-1-adi25charis@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20260621094312.53655-1-adi25charis@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/06/2026 11:43, Aditya Chari wrote:
> The axis-fifo driver's compatible strings were undocumented, flagged
> by checkpatch.pl as UNDOCUMENTED_DT_STRING. Add a YAML devicetree
> binding document for drivers/staging/axis-fifo, converted from and
> replacing the existing free-form text binding (axis-fifo.txt), which
> this patch removes.
> 
> Constrain xlnx,tx-fifo-depth to a minimum of 4, since the driver
> subtracts 4 from this value in its transmit bounds check and a
> smaller value would underflow that check.
> 
> Signed-off-by: Aditya Chari <adi25charis@gmail.com>
> ---
> 
> Changes since v2:
> - Added $ref: /schemas/types.yaml#/definitions/string to the three
>   AXI-Stream protocol enum properties (xlnx,axi-str-rxd-protocol,
>   xlnx,axi-str-txd-protocol, xlnx,axi-str-txc-protocol) for explicit
>   type consistency with the rest of the schema.
> - Added minimum: 4 to xlnx,tx-fifo-depth, since the driver subtracts
>   4 from this value in its transmit bounds check
>   (axis_fifo_write()) and a smaller configured value would underflow
>   that unsigned check, bypassing the oversized-packet guard.
> 
> Changes since v1:
> - Fixed xlnx,rx/tx-fifo-depth: depth is in 32-bit words, not bytes,
>   matching the driver's overflow check in axis_fifo_write() and the
>   wording of the original text binding.
> - Restored the full set of hardware-generated properties (interrupt-
>   names, AXI-Stream protocol/width properties, has-axis-t* feature
>   flags, fifo threshold properties, etc.) so that additionalProperties:
>   false does not reject valid device trees generated for real hardware.
> - Removed the now-superseded axis-fifo.txt text binding.

Please slow down. Three versions within 1 hour! Why sending something
and immediately sending fixes to it?

> 
>  .../bindings/misc/xlnx,axi-fifo-mm-s.yaml     | 227 ++++++++++++++++++
>  drivers/staging/axis-fifo/axis-fifo.txt       |  96 --------

Why are you touching staging binding?

https://lore.kernel.org/all/?q=dfn%3Aaxis-fifo.txt

Best regards,
Krzysztof
