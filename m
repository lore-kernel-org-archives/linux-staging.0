Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D011972
	for <linux-staging@lists.linux.dev>; Mon, 14 Jun 2021 09:13:35 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id b37so3157064ljr.13
        for <linux-staging@lists.linux.dev>; Mon, 14 Jun 2021 02:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=aYrwM/2jwUEYL91iCCGN3QRwe93iFREWLi7YK2Py+GU=;
        b=DndfFDoSadgd8/18IL7VTtiyztAK1VzSL5+Z2xMk0oM3RUDcMo8RWUWuEi15Ak67ID
         izE8iIbFHkb70mWCENeYtNc2sTQE999kYWtFKwX+DB8p8W81c/EyryIzi9jXnWA0sI9k
         9aXyk5VCP06EeReSmSLO8Sx9wlRLrouR3WubiXPzN57hHSJuGN4BSiePz6xN9XlHGmuE
         CWby7QmrBbwHmVR0ly36iO/6O8bGp6nIPZOB+g0/4VZ68zyJ/YI+DJ/kev6HkQRMhu6z
         GU0bxA7G4dBfGwynJv4NOSvepcnYlYRETHvSF65MJEC+JXa+J/VImbBkUNF6Tvque5mp
         VQ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=aYrwM/2jwUEYL91iCCGN3QRwe93iFREWLi7YK2Py+GU=;
        b=efldKKT6w91pYF5BOhnVd2wpAHaYwjstGuNrN/ZOBB7v2FpgA+qy2wP15l+cyY8ulA
         FiXqtexaVrAizJrERtFRKt0oGWSd6f12q42Y7U7fPy4dsqwvK9xftPy19KSQHH6YeQV6
         pMNXeTqZz3dXTfMQq7OnrARKTfq9kEK6EcbthWCQ68CT5hT8pcPFj8XoXuS0VfxM/0Dr
         ESP6kgmdoLqPR7Bo0w9laBvEgBxlhv1TeHIpwi3lNcfUHKpThrjk+0ovSvkFh7fr9Q9y
         NF7coJlC/y1IRcP5FRtJOnBuWw1KeYyuOIGzGNcZzmx1zTs75Y+UG0VuN6p4rWpPjFOM
         qeMQ==
X-Gm-Message-State: AOAM531gZgxS0El1C/5HRdIjp05eM09ctdHs2opoLSSxsCG0jC4yd+dR
	pqtYq/rX5ydnV9IdqdzTwxQ=
X-Google-Smtp-Source: ABdhPJyUeqlngHPpV66o7c5WUwajrHTu74m7xomcmHCD1Z0MrUt8ElzYiFCxiEDZG89iqJlphBd84Q==
X-Received: by 2002:a05:651c:179b:: with SMTP id bn27mr12572481ljb.424.1623662013865;
        Mon, 14 Jun 2021 02:13:33 -0700 (PDT)
Received: from [192.168.1.100] ([178.176.79.25])
        by smtp.gmail.com with ESMTPSA id a15sm1413671lfm.54.2021.06.14.02.13.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jun 2021 02:13:33 -0700 (PDT)
Subject: Re: [PATCH 1/3] MIPS: ralink: Define PCI_IOBASE
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org, neil@brown.name, linux-mips@vger.kernel.org,
 tsbogend@alpha.franken.de, ilya.lipnitskiy@gmail.com, john@phrozen.org
References: <20210613155623.17233-1-sergio.paracuellos@gmail.com>
 <20210613155623.17233-2-sergio.paracuellos@gmail.com>
From: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <12f81f6e-41be-7e0f-5590-67591c722a38@gmail.com>
Date: Mon, 14 Jun 2021 12:13:29 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210613155623.17233-2-sergio.paracuellos@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hello!

On 13.06.2021 18:56, Sergio Paracuellos wrote:

> PCI_IOBASE is used to create VM maps for PCI I/O ports, it is
> required by generic PCI drivers to make memory mapped I/O range
> work. Hence define it for ralink architectures to be able to
> avoid parsing manually IO ranges in PCI generic driver code.
> Function 'plat_mem_setup' for ralink is using 'set_io_port_base'
> call using '0xa0000000' as address, so use the same address in
> the definition to align things.
> 
> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> ---
>   arch/mips/include/asm/mach-ralink/spaces.h | 10 ++++++++++
>   1 file changed, 10 insertions(+)
>   create mode 100644 arch/mips/include/asm/mach-ralink/spaces.h
> 
> diff --git a/arch/mips/include/asm/mach-ralink/spaces.h b/arch/mips/include/asm/mach-ralink/spaces.h
> new file mode 100644
> index 000000000000..ec58d4a9ed05
> --- /dev/null
> +++ b/arch/mips/include/asm/mach-ralink/spaces.h
> @@ -0,0 +1,10 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __ASM_MACH_RALINK_SPACES_H_
> +#define __ASM_MACH_RALINK_SPACES_H_
> +
> +#define PCI_IOBASE	_AC(0xa0000000, UL)
> +#define PCI_IOSIZE	SZ_16M
> +#define IO_SPACE_LIMIT  (PCI_IOSIZE - 1)

    Why this sudden switch to spaces for indentation? Previous lines were 
(correctly) indented with tabs...

> +
> +#include <asm/mach-generic/spaces.h>
> +#endif

MBR, Sergei
