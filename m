Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68DD017C3
	for <linux-staging@lists.linux.dev>; Mon,  2 Oct 2023 08:02:46 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-317c3ac7339so15562306f8f.0
        for <linux-staging@lists.linux.dev>; Mon, 02 Oct 2023 01:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696233764; x=1696838564; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y6nQA+7IdEGVeShtOyMA1surPP+2JRBkHyJxsRPLijQ=;
        b=F48ah0YoCSpNjx91aUzLidShi8nCAzW98GtWGQclfMYsK10gzbWjXjLU/FMlGszGP3
         5C53eRjiti7e2VvVOUgtjzM9reEBGsQbTBkgdpLVyh+DDS/fg6389UY5qLVD+AAC/VcO
         Wp6KHbh0TjEUkt83aF/FpFbgeMdTPoFtGSKB8Mg0/ufJ529/6V9Z8WkDGisPJYdA+UQD
         emE4uWFVocwgjeknIv+5gcvAki+UjrDyIBY9V8X0UQlrNw8ab66Ry3YjOSfOMyMytYdh
         Mku9Jof/iIc0zgHpU+wTdsxiyqkTLSbTCLqtXTRujV+F6xZrvX6rBvC67UVjb4IDszB4
         MKrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696233764; x=1696838564;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y6nQA+7IdEGVeShtOyMA1surPP+2JRBkHyJxsRPLijQ=;
        b=FX1O5YJ4IUWVjuf5H1h5A6dGispquid37UAwmXvFpQ8Da97JDeqDqI4E5JSIyt1JKS
         Q1wEMNT2mEs/4upKb0GZMkU5LVt1DyxiMyyG+PqZhnqSb/rmm6vKTxOvLQxr4ObEDVbR
         bk5BcZUHtDsQxDpJLoPCY1fuZOeIPvAG2NDErJ40uwEcZOLEaO0BVX/+cCwj0KMaetaz
         eSy+5HqG3BSxsqIn6Y/b22PqfKB+rjRmEGmlyNO6DFI/iCM3iuCCeEA9qffP+ryJEmsc
         kf3BVw1K2DHLQl1oEHrxY5od7SzJYsZuNUM2zcMUJwO3Dceix2fgoxS/OysWBDDhIXsk
         szOw==
X-Gm-Message-State: AOJu0Ywt5hmP17AY/Ry/rqa6M6jwW6bZzAQDxnahMv4KJt2zIHQeE6DB
	QVvChaZ+JIdk2d2847hJGXW6cg==
X-Google-Smtp-Source: AGHT+IG+SIdpkH2w32xvRD5YxMNyd5NqxjZoHzXm9cLdi5kGPZjemkeSqZXoaAiWaNjNYY9xhHEktg==
X-Received: by 2002:a5d:63d2:0:b0:313:e953:65d0 with SMTP id c18-20020a5d63d2000000b00313e95365d0mr10034512wrw.28.1696233763900;
        Mon, 02 Oct 2023 01:02:43 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id k10-20020adfd22a000000b0032320a9b010sm19655680wrh.28.2023.10.02.01.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 01:02:43 -0700 (PDT)
Date: Mon, 2 Oct 2023 11:02:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: David Lechner <dlechner@baylibre.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-staging@lists.linux.dev, David Lechner <david@lechnology.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Axel Haslam <ahaslam@baylibre.com>,
	Philip Molloy <pmolloy@baylibre.com>, linux-kernel@vger.kernel.org,
	Apelete Seketeli <aseketeli@baylibre.com>
Subject: Re: [PATCH v3 01/27] dt-bindings: iio: resolver: add devicetree
 bindings for ad2s1210
Message-ID: <2416fa1b-86f1-40d5-b7b5-5fe85e0a8472@kadam.mountain>
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

On Fri, Sep 29, 2023 at 12:23:06PM -0500, David Lechner wrote:
> From: David Lechner <david@lechnology.com>
> 
> From: David Lechner <dlechner@baylibre.com>
> 

Having two from headers kind of messes things up.  The second From is
included in the body of the commit message.

regards,
dan carpenter

