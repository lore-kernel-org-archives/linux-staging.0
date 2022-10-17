Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 084407F;
	Mon, 17 Oct 2022 21:06:22 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id iv17so9475950wmb.4;
        Mon, 17 Oct 2022 14:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ny9S84ddMU/C3tkLJNxlEIFlBnKSkg7GhMCarBjMO4Q=;
        b=QlTlQ0/Gn+KJSTCePByReUXYSh/U0B4FRFME4WIA6QXwUPH+oMXWtbKdMueJ2F9N8i
         UFvPp5gZhswevOSeG/3xinkO/wBwalFH/8vdhqDu42/o9B6KqawED2AIA7kB0VVAmKFH
         Sgw1bceGoRnG+C5wLhBaBWO9YI+FhEbwd8sKyn/TKWQKDioYUPdsWVTVcjEVSWLYj61j
         yNDJaXQ57YW5v0iqXIAABEghuroeKbBQ/wFPppeCXsJY4ZBCVrtHdUTsRGAnTJpsaiaU
         dxao9aDjAK9HuE2xwShYxiuxsVyQaxbWhsdwMpU4DJrqg70j+qLhTZkc3QS8efmsviwW
         /sxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ny9S84ddMU/C3tkLJNxlEIFlBnKSkg7GhMCarBjMO4Q=;
        b=hYXwNeLI2H2WnUDjvuGTTk3aE8D8xXem3qJQGkTVqJDJ2BHAV2h/arOBlGCcWUX/z2
         rCFKugjA9NgvmEV3vDStWzdp4PjMKXy9E6D83gU6IZRgeTyaYoG7qWj+cSJa/e2ih6gx
         OmFIEhiO4StUOqucuPu1emseW7I0JuOe2n13+4JbYsCElRkFZ2z9eGH5ZO1GyMq6R24W
         jDixKcc4Jrqq88wejkopEKGaUXYtk63PJWObFvEnUhmKYVKrjz3t5MSNX7MZYBaK9yTy
         k7SKGjHt2HIozB25A1fuQQQbkPLhcbtQgd/khRYaWTz4yKyPKWn4YaV6Wh2P99z6I4YM
         xHnQ==
X-Gm-Message-State: ACrzQf1X4/Oq1yTs5cbEOt0y7fwo3Kh2+KtZmX4hiz7/lnvE93C38THx
	ak1VnSibOk/O3u1qoo+RR3g=
X-Google-Smtp-Source: AMsMyM4XdCoQpXejZXuEi4kxewPjDf//Qgwvgno6/Vza+YHole7Od6uFXjHHZOLzidb9HSq2V6ROww==
X-Received: by 2002:a05:600c:4e51:b0:3c0:55e0:7719 with SMTP id e17-20020a05600c4e5100b003c055e07719mr8919840wmq.3.1666040781142;
        Mon, 17 Oct 2022 14:06:21 -0700 (PDT)
Received: from [192.168.1.104] (p57ba2cf5.dip0.t-ipconnect.de. [87.186.44.245])
        by smtp.gmail.com with ESMTPSA id h21-20020a05600c499500b003c4ecff4e25sm11058305wmp.9.2022.10.17.14.06.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Oct 2022 14:06:20 -0700 (PDT)
Message-ID: <da0daaa7-8e2c-103e-0261-8685739e297d@gmail.com>
Date: Mon, 17 Oct 2022 23:06:19 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: Re: [PATCH v1 0/4] staging: r8188eu: trivial code cleanup patches
To: Deepak R Varma <drv@mailo.com>, outreachy@lists.linux.dev,
 Larry.Finger@lwfinger.net, phil@philpotter.co.uk, paskripkin@gmail.com,
 gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Cc: kumarpraveen@linux.microsoft.com, saurabh.truth@gmail.com
References: <cover.1666021212.git.drv@mailo.com>
Content-Language: en-US
In-Reply-To: <cover.1666021212.git.drv@mailo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/17/22 17:56, Deepak R Varma wrote:
> Address different kinds of checkpatch complains for the staging/r8188eu module.
> The patches are required to be applied in sequence.
> 
> Changes in v1:
>     1. Improve language / grammar for the patch descriptions
>     2. Further improve code reformatting
> 
> Deepak R Varma (4):
>    staging: r8188eu: use Linux kernel variable naming convention
>    staging: r8188eu: reformat long computation lines
>    staging: r8188eu: remove {} for single statement blocks
>    staging: r8188eu: use htons macro instead of __constant_htons
> 
>   drivers/staging/r8188eu/core/rtw_br_ext.c | 122 +++++++++++-----------
>   1 file changed, 62 insertions(+), 60 deletions(-)
> 
> --
> 2.30.2
> 
> 
> 
> 

I think this patch series should be v2 as the first one was a v1. The 
next one should be the v3.

Please do variable changes driver wide and not only limited to a file.
Example:
This line contains the old variable:
void *scdb_findEntry(struct adapter *priv, unsigned char *ipAddr);

But in this line you have already changed ip_addr.
void *scdb_findEntry(struct adapter *priv, unsigned char *ip_addr)
{
	unsigned char network_addr[MAX_NETWORK_ADDR_LEN];
	struct nat25_network_db_entry *db;
	int hash;
...


Please change all networkAddr and not only some.

Is it possible to changing __constant_htons as well in the entire driver?

Driver can be applied and compiled.
Tested device.

Thanks

Bye Philipp


