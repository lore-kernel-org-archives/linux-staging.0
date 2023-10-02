Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A021B1A725;
	Mon,  2 Oct 2023 15:18:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA8BBC433C8;
	Mon,  2 Oct 2023 15:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696259939;
	bh=lmDK/17Fngc1kg4dfIW5twFn4x3TYjYfw27f9xOXV1U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vCqYIcaiElzr8NzJqqWeOZ6uFrUZ4guUWrhzXOHEBrJ83s8Qh+S8YDapmP89FXX3u
	 an1BWeXkh5f88xSZbwUkpHQRgtF/8vWB0IPHLamfOve3aFziV8Gc2IaXYdRCrTEedZ
	 a5c602MEKoFhQ7dM141hFfQFPRidntjWvowpxamXzNkG9Q9BCKP+5ToY2l/eWbUn7D
	 0S3TOnbctyds9RXe/rn/K7Vy9b+SwEJESDaEInLyGIm1XCCj+mFbsGemYDbwvugeTQ
	 cRxG/pU/lPZeBzAsrsajKnjv54IhI3VTCFaGSF3cjbFnPOMy3bI3t9F65cpPeSeioq
	 4RyJnIwSZYKcQ==
Received: (nullmailer pid 1747003 invoked by uid 1000);
	Mon, 02 Oct 2023 15:18:56 -0000
Date: Mon, 2 Oct 2023 10:18:56 -0500
From: Rob Herring <robh@kernel.org>
To: David Lechner <dlechner@baylibre.com>
Cc: Philip Molloy <pmolloy@baylibre.com>, linux-staging@lists.linux.dev, Axel Haslam <ahaslam@baylibre.com>, Apelete Seketeli <aseketeli@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-iio@vger.kernel.org, Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, linux-kernel@vger.kernel.org, Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, devicetree@vger.kernel.org, David Lechner <david@lechnology.com>
Subject: Re: [PATCH v3 01/27] dt-bindings: iio: resolver: add devicetree
 bindings for ad2s1210
Message-ID: <169625993628.1746950.6393858750841663279.robh@kernel.org>
References: <20230929-ad2s1210-mainline-v3-0-fa4364281745@baylibre.com>
 <20230929-ad2s1210-mainline-v3-1-fa4364281745@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230929-ad2s1210-mainline-v3-1-fa4364281745@baylibre.com>


On Fri, 29 Sep 2023 12:23:06 -0500, David Lechner wrote:
> From: David Lechner <david@lechnology.com>
> 
> From: David Lechner <dlechner@baylibre.com>
> 
> This adds new DeviceTree bindings for the Analog Devices, Inc. AD2S1210
> resolver-to-digital converter.
> 
> Co-developed-by: Apelete Seketeli <aseketeli@baylibre.com>
> Signed-off-by: Apelete Seketeli <aseketeli@baylibre.com>
> Signed-off-by: David Lechner <dlechner@baylibre.com>
> ---
> 
> v3 changes:
> * Expanded top-level description of A0/A1 lines.
> * Added required voltage -supply properties. (I did not pick up Rob's
>   Reviewed-by since I wasn't sure if this was trivial enough.)
> 
> v2 changes:
> * Add Co-developed-by:
> * Remove extraneous quotes on strings
> * Remove extraneous pipe on some multi-line descriptions
> 
>  .../bindings/iio/resolver/adi,ad2s1210.yaml        | 177 +++++++++++++++++++++
>  1 file changed, 177 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

