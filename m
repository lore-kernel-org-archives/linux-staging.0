Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C0E21D79
	for <linux-staging@lists.linux.dev>; Tue,  1 Nov 2022 23:26:41 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id 13so41055552ejn.3
        for <linux-staging@lists.linux.dev>; Tue, 01 Nov 2022 16:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VjaxTnD+RIihVp0m1FGP/cxt8pNup1dJPxpfJslNDq0=;
        b=l905ClINmGBf1QRIARIGmkV+n9JhSylgXMU1TcpUnMgXVDuPCiyL8k1qc/rQ6iXo9U
         weF7KiBTqP7NLIhVUvMKTichGHCAnRyEaXP9tOD5gvcyqE6qVs1Rs3FbJoXb0B8fJEsO
         eV8giN2nVTaP8VgW8kNXGB3h3rs8QlTjcl9dzq1MeuBxIM1HlI9+RK0JZiJUjjadjwuy
         8wHKDcfDgC4tZp/aT0yUoGqkMMdyM1Adid6vWG/Lqa6TV5wUZr2n6Bxid8V5DZYRN4qD
         wL31Mq913v2mKdqqhzJ3cf9+JjUx3mRbdN9+7gesd9goH2gBfH6N2xQZ7Q+53KIgyxi+
         pueg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VjaxTnD+RIihVp0m1FGP/cxt8pNup1dJPxpfJslNDq0=;
        b=Skx+/TeV+ONSKjVcLRMAdKVGcbJRJ7mbrcopoFinEuJhCsAD29KFYujziGjJIbD57t
         C3Gyg8ne8bolsUTCArJGcNM2Qav/JhEnTdMBd6SlF8pWAA15+y77gNL2CGCq9wBEHNcb
         2jj9wwCCLukmn7If7bhN3Xl8PpIpkaxLxdazPq3TyNXd2D0iDqh9yxpxTBxOTZQetBIH
         +N3g7fOXgBRCWA+h+riHS9Na+irMfiXRPDRjHU8RRAUYg5G7MisvkHUFLvaaZwe9LSg2
         8aK6e6E4BHHn8utV7kkWLTloZ4GK9hb9/v90uUS7MN0673iJLIuJzCMjt/B7mOd22YXv
         kzbQ==
X-Gm-Message-State: ACrzQf1FLzZu86prKj7WBmVDo2FSUENRKmkWNXjU4M2KMkKQ+zRSQGFu
	hdau9AXwNm47N+Tc8xccr3s=
X-Google-Smtp-Source: AMsMyM51/dwqW/J04wkNqDaDuY77JtN/Er/BG5P4RbcUcTNG9pWX27ABWK4tfQCvB7j4nrPML4r+bQ==
X-Received: by 2002:a17:906:6a17:b0:794:f0e8:1918 with SMTP id qw23-20020a1709066a1700b00794f0e81918mr20990385ejc.474.1667345199742;
        Tue, 01 Nov 2022 16:26:39 -0700 (PDT)
Received: from [192.168.1.102] (p57935738.dip0.t-ipconnect.de. [87.147.87.56])
        by smtp.gmail.com with ESMTPSA id mj21-20020a170906af9500b00773f3ccd989sm4717136ejb.68.2022.11.01.16.26.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Nov 2022 16:26:39 -0700 (PDT)
Message-ID: <32a31a3d-99df-c402-9889-51ca4f8c041a@gmail.com>
Date: Wed, 2 Nov 2022 00:26:38 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/2] staging: r8188eu: two simple cleanups
Content-Language: en-US
To: Michael Straube <straube.linux@gmail.com>, gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20221101191458.8619-1-straube.linux@gmail.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20221101191458.8619-1-straube.linux@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/1/22 20:14, Michael Straube wrote:
> This series contains two simple cleanup patches.
> Tested on x86_64 with Inter-Tech DMG-02.
> 
> Michael Straube (2):
>    staging: r8188eu: remove extern from function prototypes
>    staging: r8188eu: convert rtw_free_stainfo() to void
> 
>   drivers/staging/r8188eu/core/rtw_sta_mgt.c     |  8 ++------
>   .../staging/r8188eu/include/osdep_service.h    |  2 +-
>   drivers/staging/r8188eu/include/rtw_mlme_ext.h |  4 ++--
>   drivers/staging/r8188eu/include/sta_info.h     | 18 +++++++++---------
>   4 files changed, 14 insertions(+), 18 deletions(-)
> 

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> # Edimax N150
