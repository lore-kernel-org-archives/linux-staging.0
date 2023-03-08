Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0818C3C31
	for <linux-staging@lists.linux.dev>; Wed,  8 Mar 2023 13:04:01 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id o12so65356630edb.9
        for <linux-staging@lists.linux.dev>; Wed, 08 Mar 2023 05:04:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678280639;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zs0UM8kM2VnC2EAMlxdhs+9Wg86DimtKYhjwLouXb0w=;
        b=phI9E6E+6NGntYmcjDEaftMqtjJ3KQXg966Z6kvp9OWhYYOdJadiRO3U7J8+NH/ix9
         VV+VugQFAc2Vl04g84B/J4Bb44ibJqWmiu1rBp31KbUvWUw60a9q7lrITgVucTksu8oc
         7sr9C+DUxF5tKUudh2xq75LYqziavUsjqLmlWz62k+nN528NzxXIps/sNGKPppTYdZMl
         EzzxXWRNn7YBjCbH8l2vkCqHMsCUVgJAfA9XnBkxBm8Zgee9uBa9F+4tKISmw2gIT5po
         6SDN9B2jRrjWDrimAFCgGGlUikQCHXI2pVQl7+D5waqvvPAqZIid0++6S78iN3iPlT66
         HzdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678280639;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zs0UM8kM2VnC2EAMlxdhs+9Wg86DimtKYhjwLouXb0w=;
        b=nbSgPthNBqGrZsIFReGBbsQogBvcYzPQEypUNN7xviyszzSqXwxFCv9wZduKyjGAo5
         Zc4RjyskTxZ8ZFZvhWxxOFzTvCDPX+zrqPves+na3+NW3vkPiyrI73CGHloIcaFoOTjD
         L5Hj3x/j92O+mxNvnHaKrFbXJqMw+DkjqkzpixtrnWRPkjYAKt0rEtaL9aVovgJUT8rK
         4/4jKnnptFHwK+R7pLuGodJ8VNY/bDjkG+X0O457bSiJOmiOXGsk2bg7ppLVAiT9i/R5
         WC5/71kRZOgm96hyPDvYM4eUv8SYJ6oT3tHttfQ5/JtbO5/39xdoM2aMiwzw1kxO4H7b
         sc8g==
X-Gm-Message-State: AO0yUKVq4lpFYlF97OGbPvG9wG7zRrmBjgIn9HlXtAvJPDP3CuIIAKL2
	0sf14Wzn8m2aELi8Fu7cbmI=
X-Google-Smtp-Source: AK7set+25e0jiz/QfBLhshopEKwFYJQZdMjPeDw15rvcubhtLK1wub6a7200Hu9ZmXQIk7BdoxUBNQ==
X-Received: by 2002:a17:906:db05:b0:889:5686:486a with SMTP id xj5-20020a170906db0500b008895686486amr22406068ejb.30.1678280639119;
        Wed, 08 Mar 2023 05:03:59 -0800 (PST)
Received: from [127.0.0.1] ([46.211.69.230])
        by smtp.gmail.com with ESMTPSA id u2-20020a170906c40200b008e2dfc6382asm7445708ejz.125.2023.03.08.05.03.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 05:03:58 -0800 (PST)
Date: Wed, 08 Mar 2023 15:03:57 +0200
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Mark Brown <broonie@kernel.org>
CC: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Maxim Schwalm <maxim.schwalm@gmail.com>,
 Dmitry Osipenko <digetx@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_7/8=5D_dt-bindings=3A_sound=3A?= =?US-ASCII?Q?_nvidia=2Ctegra-audio=3A_add_MAX9808x_CODEC?=
User-Agent: K-9 Mail for Android
In-Reply-To: <8c24e719-2ca8-4571-8d00-cc9d488d56ff@sirena.org.uk>
References: <20230308073502.5421-1-clamor95@gmail.com> <20230308073502.5421-8-clamor95@gmail.com> <8c24e719-2ca8-4571-8d00-cc9d488d56ff@sirena.org.uk>
Message-ID: <915E75D9-8D29-4A72-9E53-841D5A420BAB@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



8 =D0=B1=D0=B5=D1=80=D0=B5=D0=B7=D0=BD=D1=8F 2023 =D1=80=2E 15:02:28 GMT+0=
2:00, Mark Brown <broonie@kernel=2Eorg> =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=
=B0=D0=B2(-=D0=BB=D0=B0):
>On Wed, Mar 08, 2023 at 09:35:01AM +0200, Svyatoslav Ryhel wrote:
>> Add dt-binding for MAX9808x CODEC=2E
>
>This is adding a binding for a machine driver with these CODECs, not for
>the CODEC itself=2E

Fair, I will update name in v3
