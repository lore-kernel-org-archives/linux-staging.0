Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709B447366;
	Fri, 22 Sep 2023 22:44:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5137C433C8;
	Fri, 22 Sep 2023 22:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695422642;
	bh=53Onsy+ZW7rqbwjy97PFrpjs6d8nYu1/Bx+wXNJCqaA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C0qdJ2paJC4V57QqnfkIKfUKqVenLouKnVUTsVUib0hWtbyYjMiRrXD23ghIBS+2v
	 0X130XtcgWgnkYvH5bzasknC2dgqf4v9yjHbB8+/NWA0n/8A0xaxaYOcfempMvO+Z0
	 f9JVPBOICU7uFRvfnR2dToF0Ikfphv2+i7vrhjUAJIAnWJvrz42OQYVCEoRAalOIKb
	 t1hlJCA1k6vwQbmZEZEV858VD1IaL3rtm/PVHxz9dPqYbLISpTMqGYVX38/o/4KviT
	 X4rNHWcqeaGOnfGQKoUYvgCiiRkRrvA+CEOidOkHfRlPY5RwFtsdmCAumVTMlboZXR
	 VMd4vzRoC+4DA==
Received: (nullmailer pid 4068089 invoked by uid 1000);
	Fri, 22 Sep 2023 22:44:00 -0000
Date: Fri, 22 Sep 2023 17:44:00 -0500
From: Rob Herring <robh@kernel.org>
To: David Lechner <dlechner@baylibre.com>
Cc: Conor Dooley <conor+dt@kernel.org>, Philip Molloy <pmolloy@baylibre.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>, Axel Haslam <ahaslam@baylibre.com>, Jonathan Cameron <jic23@kernel.org>, Michael Hennerich <Michael.Hennerich@analog.com>, Apelete Seketeli <aseketeli@baylibre.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-staging@lists.linux.dev, linux-iio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 01/19] dt-bindings: iio: resolver: add devicetree
 bindings for ad2s1210
Message-ID: <169542264006.4068010.15737012962684747566.robh@kernel.org>
References: <20230921144400.62380-1-dlechner@baylibre.com>
 <20230921144400.62380-2-dlechner@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230921144400.62380-2-dlechner@baylibre.com>


On Thu, 21 Sep 2023 09:43:42 -0500, David Lechner wrote:
> This adds new DeviceTree bindings for the Analog Devices, Inc. AD2S1210
> resolver-to-digital converter.
> 
> Co-developed-by: Apelete Seketeli <aseketeli@baylibre.com>
> Signed-off-by: Apelete Seketeli <aseketeli@baylibre.com>
> Signed-off-by: David Lechner <dlechner@baylibre.com>
> ---
> 
> v2 changes:
> * Add Co-developed-by:
> * Remove extraneous quotes on strings
> * Remove extraneous pipe on some multi-line descriptions
> 
>  .../bindings/iio/resolver/adi,ad2s1210.yaml   | 150 ++++++++++++++++++
>  1 file changed, 150 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/resolver/adi,ad2s1210.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

