Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B77D7B;
	Fri, 15 Apr 2022 01:08:08 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id b24so8335004edu.10;
        Thu, 14 Apr 2022 18:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Cpinv0gHO+HxVm83FVzuNg/GVVXCEmgbgcCu4WDaj7M=;
        b=Ffg7XcD9snn2//qJljQ5v+P7ngZV1vDMeFevxj0RrIeSf2mwsp5r7LSIT9RTakX22R
         /+RRihuzrYpU0fBPxlhWhhJh0nQfzFAUFe/W4uZCWP9kUl71jGvT4HVjATOw+D2F5YjZ
         08sPZeDiY5ZyRiCNnK7qIt6SdwZyhD3/mHyTUstaoGgQA2AdR5YFq3X1rae38wEh0GRB
         CAyZaEdrfdKuy1XCeOh0gHzaorLylrjd+HuYDEg0FL4GMgZjnJ41yJEKhJErkzkQhPcJ
         2UjZZ1uQeBJEvb1c8X4sdsJldqmWk08ORVPkEECoUP+HoOwalsUvNEw+3xaZ+XSvAkqr
         zj9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Cpinv0gHO+HxVm83FVzuNg/GVVXCEmgbgcCu4WDaj7M=;
        b=tyjzPt8DapesdXS+d4Hbv7SVvKYDJjV9w5VvWD/6Tll7ER3BPC/ymrB5j8HCvLmUth
         EHLdYR2GmrHbt8N47l8zJo+qrRrYF5nwKUTQSe+iUkS92Sue887cAlWIpz0enQu8HiRu
         LNnw2AfhSdbvJl9PMTL2DXjw230yYUEy2uEkOcz2Opc7qshkERdQXEkra1/UJwq+8+OM
         k0dNsJwT2I5vEXFOJ2tbXsaQ/9HsZA4ILwsfQPcIHq4TvD/DpQaoXkUxXOmXO/7RhaL0
         4r6UBU6cUWkV4jcLTZDKW7/XNxDz4BTybyNIIm3Iy0kCbTNOQBNmNWrfSw2WWKkjJrZk
         KzSQ==
X-Gm-Message-State: AOAM531awxSzcTbU7tDGo/Ajs9H7NH1nlObjFLnIY/n8QlQDytp8ydwm
	zJftcu4KpBgCZjoeP2mI26I=
X-Google-Smtp-Source: ABdhPJyDjxkouJ0VBiQARUFq4JVw6eshlqNYqQSSEvzricjMxsG5DAG8olEisMcVleCmDTv66mkbeQ==
X-Received: by 2002:a50:d087:0:b0:41d:7ea6:462a with SMTP id v7-20020a50d087000000b0041d7ea6462amr5863585edd.355.1649984886575;
        Thu, 14 Apr 2022 18:08:06 -0700 (PDT)
Received: from leap.localnet (host-79-43-11-75.retail.telecomitalia.it. [79.43.11.75])
        by smtp.gmail.com with ESMTPSA id g24-20020a1709063b1800b006e8cf786ee8sm1134001ejf.21.2022.04.14.18.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Apr 2022 18:08:05 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Ira Weiny <ira.weiny@intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tsuchiya Yuto <kitakar@gmail.com>, Martiros Shakhzadyan <vrzh@vrzh.net>, Hans de Goede <hdegoede@redhat.com>, linux-media@vger.kernel.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Subject: Re: [PATCH] staging: media: atomisp: Use kmap_local_page() in hmm_store()
Date: Fri, 15 Apr 2022 03:08:03 +0200
Message-ID: <4415369.cEBGB3zze1@leap>
In-Reply-To: <Yli+R7iLZKqO8kVP@iweiny-desk3>
References: <20220413225531.9425-1-fmdefrancesco@gmail.com> <Yli+R7iLZKqO8kVP@iweiny-desk3>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On venerd? 15 aprile 2022 02:37:27 CEST Ira Weiny wrote:

> Regardless now that kmap_local_page() exists, this is correct.
> 
> Reviewed-by: Ira Weiny <ira.weiny@intel.com>

I'm pretty sure this particular patch would have had a hard time getting 
accepted without any authoritative "Reviewed-by" tag from you or other 
people more experienced than me.

Thank you very much!

Fabio M. De Francesco


