Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C10B4AB7
	for <linux-staging@lists.linux.dev>; Fri, 18 Feb 2022 17:48:53 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id c10so5378128ljr.9
        for <linux-staging@lists.linux.dev>; Fri, 18 Feb 2022 09:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=UBQJQxk57KVmmWwqpt5wwYAP2wFmkmOERw/E1car8z4=;
        b=CrZSv+53Qrbk/xbEWiqhgVvVDLGEVE76DC8r47OlzLVeWE3y81wO6EtlKgvRRJkekF
         P/ZjltimRmKMfe3e2Jn+TPnDUpUHj59VnYZqBzaEDFyy4/C6iNVe8w61X2flr6CS7L6Y
         393T6GTyNRvY9gEIGf9qvlV+1w+irRM6nfuvyBDL1uCc2tjoMTk/yawWd6adlnyMe+8M
         Ag8rfqXqGtLetOGl3Ef8DUQbZHzpbEO6n4GAaQp3xNYmmC6IVBwGD34fFq5Xtysl+J56
         wfI8KtdcYV9EXovBrM2X2CH1YK+2peLp5Jg24G8ZcOWtgLNtWvpc2WaZb7evg6h7FDzV
         oFuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=UBQJQxk57KVmmWwqpt5wwYAP2wFmkmOERw/E1car8z4=;
        b=1S/XnUazSv3vpx7LUDPhqqbPCR824cEa+nx59j/cO3wsXiZ/xOgRhaDePVvFrUnmMU
         g0P8Rnmw5G+Sai1wUYo+YrPOrFqil3acPTcyqzCGD3MuBxAsjHI6opucXOIy9/F63ZGO
         JEa82QnNyAk6Qv0ZtkzjHIOzIdwKZsLgvtwDWUg2nk7xFqe0vWS+J3yM9QC24is4rGW0
         Qmeh3oTw077B2uuU60Zm98H8zQsMWHO6wlbAOnj7grimPdzI89hsB/oHAweOhsCQdi1K
         fFaqnzTWms1taY4XZQvS5CUreY1PSdI1GgM335xIfkfom+MiXE+4cy+nhVJqKM6ymOyL
         aJJA==
X-Gm-Message-State: AOAM533Wh4LRjYTVZI0U7WXbH50Zvc4kNzDBg7T3THb3UpZ225VuEO4a
	7wX2Yskb/Ix55eKF/yZjfGI=
X-Google-Smtp-Source: ABdhPJwyi5fZBmE+2EKAPyT52Jhwt7YBdt1W7ao6OtGUxrJuTK75QectzagveZP33jp8lkLgpgLSPw==
X-Received: by 2002:a2e:9c94:0:b0:244:4ec3:3313 with SMTP id x20-20020a2e9c94000000b002444ec33313mr6402675lji.281.1645206531518;
        Fri, 18 Feb 2022 09:48:51 -0800 (PST)
Received: from [192.168.2.145] (109-252-138-165.dynamic.spd-mgts.ru. [109.252.138.165])
        by smtp.googlemail.com with ESMTPSA id m21sm127705ljp.54.2022.02.18.09.48.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Feb 2022 09:48:50 -0800 (PST)
Message-ID: <0a9e14f8-02db-2d3f-c0d5-04c53919de07@gmail.com>
Date: Fri, 18 Feb 2022 20:48:49 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 0/4] Add V4L stateless video decoder API support to
 NVIDIA Tegra driver
Content-Language: en-US
To: Hans Verkuil <hverkuil@xs4all.nl>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220207141937.13089-1-digetx@gmail.com>
 <58bfb1fb-431d-a47d-ee9e-fbef89a700a0@xs4all.nl>
From: Dmitry Osipenko <digetx@gmail.com>
In-Reply-To: <58bfb1fb-431d-a47d-ee9e-fbef89a700a0@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

18.02.2022 18:04, Hans Verkuil пишет:
> Dmitry,
> 
> On 07/02/2022 15:19, Dmitry Osipenko wrote:
>> Support V4L stateless video decoder API by NVIDIA Tegra decoder driver.
>> Tested using GStreamer [1] and libvdpau-tegra [2][8].
>>
>> [1] https://github.com/grate-driver/gstreamer/commit/b8509bdbb69b534e61419ea1798f32f9ad2f3597
>> [2] https://github.com/grate-driver/libvdpau-tegra/commit/f822e95911e5e0c39f8ba19f843ddc1e0138d5ce
>> [8] https://github.com/grate-driver/libvdpau-tegra/commit/80db4d02369f2a984ce3173d6bc305f32e9fdb97
> Nice work!
> 
> Can you make a v4 that just moves the whole driver to drivers/media/platform? I see no
> reason for keeping this in staging.
> 
> Once I have a v4 that does that I plan to make a PR for it.
> 
> For the v4 don't forget to update MAINTAINERS with the new path and to drop the TODO
> file in staging.

I'll prepare v4 over the weekend, thanks to you and Nicolas.
