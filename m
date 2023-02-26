Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EAC65677
	for <linux-staging@lists.linux.dev>; Sun, 26 Feb 2023 19:39:03 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id f14so1771011iow.5
        for <linux-staging@lists.linux.dev>; Sun, 26 Feb 2023 11:39:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=89W8sQtkd61sVfaU10t/qKgr0MKiSQvzQZkuL6seV7U=;
        b=IEr4zeYv2z/+r+XSaaFvWLFQZBALjy8sdHb5axZA+b2y78NqYHPiPtgDzjm5kTnwGi
         oGYh5OA4pba2I0kp8uCsC3qY84o1ixONMD/x0GVW/Ni0ESJ/Mo9IbfnmPy5EItn4ermj
         gCU9wwruZzPYx6yYxxrEg/mKKyOWDZx43MXJXl1YGMG1LjjTixJ3/2W7EL26jlKJGgE1
         b9ndDe8tHLIw+0+wur1nnILBTbIC2XDRjW3WzxE/C12egH+Frpe2nr9VmctH2+GsTAK/
         ke9ieQTiEDyWx1PXV08rSo5OzGX4XYLcUqz659/ar1rg4b4Se85rZfAh6iw7zH2xKe85
         +z/g==
X-Gm-Message-State: AO0yUKV83Gk8EMaGighu9A5s3sVoNuyq5K7ixZ6aaVQKhXR1gXUrA4LZ
	DTvT/gO11G0Og8qZLDaDUQ==
X-Google-Smtp-Source: AK7set/5nBIZVAj/LVt6z9Ors0aU51Gq8OePJvNbEIYYnG/6pe8XlIx9yljAd/4a/CPHttVJgHuDsg==
X-Received: by 2002:a5d:8e01:0:b0:74c:822c:a6ac with SMTP id e1-20020a5d8e01000000b0074c822ca6acmr14735248iod.15.1677440342580;
        Sun, 26 Feb 2023 11:39:02 -0800 (PST)
Received: from robh_at_kernel.org ([2605:ef80:8069:8ddf:ff6b:c94c:94fd:4442])
        by smtp.gmail.com with ESMTPSA id v22-20020a6b5b16000000b007453a11bdf5sm1635543ioh.13.2023.02.26.11.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Feb 2023 11:39:02 -0800 (PST)
Received: (nullmailer pid 192292 invoked by uid 1000);
	Sun, 26 Feb 2023 19:38:58 -0000
Date: Sun, 26 Feb 2023 13:38:58 -0600
From: Rob Herring <robh@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Brown <broonie@kernel.org>, Dmitry Osipenko <digetx@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, devicetree@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev, Jaroslav Kysela <perex@perex.cz>, Maxim Schwalm <maxim.schwalm@gmail.com>, Takashi Iwai <tiwai@suse.com>, Jonathan Hunter <jonathanh@nvidia.com>, alsa-devel@alsa-project.org
Subject: Re: [PATCH v1 05/10] dt-bindings: sound: nvidia,tegra-audio: add
 MAX9808x CODEC
Message-ID: <167744033766.192237.14439523199147830921.robh@kernel.org>
References: <20230221183211.21964-1-clamor95@gmail.com>
 <20230221183211.21964-6-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230221183211.21964-6-clamor95@gmail.com>


On Tue, 21 Feb 2023 20:32:06 +0200, Svyatoslav Ryhel wrote:
> Add dt-binding for MAX9808x CODEC.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../sound/nvidia,tegra-audio-max9808x.yaml    | 93 +++++++++++++++++++
>  1 file changed, 93 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-max9808x.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

