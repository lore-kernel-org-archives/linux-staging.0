Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C1C1097D
	for <linux-staging@lists.linux.dev>; Mon, 26 Jun 2023 17:09:48 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-991f9148334so8631166b.1
        for <linux-staging@lists.linux.dev>; Mon, 26 Jun 2023 10:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687799386; x=1690391386;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mu2qc+86ZuPWNe3cOLE/kFwjMyt3M4/TYtXFbaFVOnc=;
        b=IbiWQ1ZGh+k+liHnuynXdUeZSe/d3JqltAcrWTsfUa3yTeA4F09/cNgGRNFiHAsnHu
         03arwTqKThwS5J4dOOHCiBaF4/iNMF8HKS7/qqJ8sZx0LwI1L5Wy5j/6c5eBpiz+I38S
         IE+ddPIWmm7Fz+fSo9EQu7XLBWLGfXzwywFlibdLO+Yro3GAOVl9JovOyQQ5mJ8FTdGH
         parDdl4PDyWcfKwOu1HQRYcJIS+v+OsKCqI7r16N+W7xbTmhe1JvLzeEryzCtu5ahxNq
         +9GGYJCRj718TQKRBCb6S9g82/C7/2ZMWcnnDpra8IJ6bXFwRlTgHZTo2r4mF0QN0xIw
         GDvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687799386; x=1690391386;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mu2qc+86ZuPWNe3cOLE/kFwjMyt3M4/TYtXFbaFVOnc=;
        b=jS9HQomvG2dttIDmUmDT6gab988UKJAkuavoyixh26WkyN8GnnNdEuCjR88REv9Zjx
         pO3nFXNDR+M88uIYYTbJGEKu64MSXISfLfu22F2eetU6+Jw45br7ZFIEdW+Kl5z1aM+q
         t1PC57eY+XeC4wj6D5B5jOOmljGxo/RsWlLbZ+4kVWPA7pAW5qZbvJyf/fZ4IQx/pxMm
         qmZ2OqrtHlxokTSgdciRMP9SyLMK3DC+x+i4iQjoMB9YT/Q7ep+lCNCzWYhkpL3+oNN+
         fvzhx+rR+rcLfECqgmBso1q23ZvuafSilFOGqYuQ8disekfNyUj/O+fOOXwfoCBKv+Dn
         pH6Q==
X-Gm-Message-State: AC+VfDx87G1qTJcjZnFe9SJr0MAnZxQdUgh8EkEfsYSReBVjHSFPepld
	KgxfDEtuJrhxDYa/5iVB6uY=
X-Google-Smtp-Source: ACHHUZ5OempIeb3DeBX+Uk2xlx6uYM9zwdRKxgI3KYI/H8Xp9pdl0eIoZ4+j6vNfVBWP1DbtlzDSJA==
X-Received: by 2002:a17:906:7a17:b0:988:73e4:b781 with SMTP id d23-20020a1709067a1700b0098873e4b781mr17028967ejo.2.1687799386316;
        Mon, 26 Jun 2023 10:09:46 -0700 (PDT)
Received: from [192.168.0.103] (p57ba2e0b.dip0.t-ipconnect.de. [87.186.46.11])
        by smtp.gmail.com with ESMTPSA id b6-20020a1709064d4600b00988c6ac6b86sm3452782ejv.186.2023.06.26.10.09.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jun 2023 10:09:45 -0700 (PDT)
Message-ID: <7caa96fb-4fb6-fb87-5d0c-fa6985fa127b@gmail.com>
Date: Mon, 26 Jun 2023 19:09:44 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 0/3] Fix some checkpatch issues
Content-Language: en-US
To: Franziska Naepelt <franziska.naepelt@googlemail.com>,
 linux-staging@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, eperi1024@gmail.com, hdegoede@redhat.com,
 quic_vjakkam@quicinc.com, johannes.berg@intel.com, tegongkang@gmail.com,
 gregkh@linuxfoundation.org, Franziska Naepelt <franziska.naepelt@gmail.com>
References: <20230625155632.32403-1-franziska.naepelt@gmail.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20230625155632.32403-1-franziska.naepelt@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/25/23 17:56, Franziska Naepelt wrote:
> This is a series of patches to fix some trivial checkpatch issues. Not all
> issues have been fixed. I intend to submit another series to fix more stuff.
> 
> Testing:
> 
> ---
> v3: Series to contain only remaining patches.
> 
> Franziska Naepelt (3):
>    staging: rtl8723bs: Fix space issues
>    staging: rtl8723bs: Fix alignment open parenthesis
>    staging: rtl8723bs: Fix remaining blank line issue
> 
>   .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 164 +++++++++---------
>   1 file changed, 85 insertions(+), 79 deletions(-)
> 
> --
> 2.39.2 (Apple Git-143)
> 
> 

checkpatch prints the following warning:
WARNING: From:/Signed-off-by: email address mismatch: 'From: Franziska 
Naepelt <franziska.naepelt@googlemail.com>' != 'Signed-off-by: Franziska 
Naepelt <franziska.naepelt@gmail.com>'

I propose you change the git email matching the one that you use to send.

When testing you can compile the driver with this command:
make -C . M=drivers/staging/rtl8723bs
Typically a compile of the entire kernel is not required.

Please use the subsystem and driver also for the Subject line of the 
cover letter.

Bye Philipp
