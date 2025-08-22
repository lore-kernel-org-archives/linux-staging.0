Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8B130146C
	for <linux-staging@lists.linux.dev>; Fri, 22 Aug 2025 14:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755871617; cv=none; b=pdvDEMRvyEvawWqpBmpKTaOEFf63QSCGDJJ/9UHPOY9Lusne/IzvzJiPzKbkJ8C/8TRvQpZwZ4zbK15ESASjX/6ntbNwim/k58ipLwVJM0OvlqkWbaPauvnjZayYMD4d9Jk/7Bz4kCW8d2I2uz3Ghp9d79D1E5spL10KTR8nqKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755871617; c=relaxed/simple;
	bh=4O1F1QLd0WBvFlW7a4rwY4rRJeJKtdwh8SPStmWdguo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z4FHyvyuBd0Npcxp4e4zWBvJaGImiIQx/V9zuOtmgRajEM28AWNbFRiv7BFijYg3yt6XbmljJOGb10QH61FFryB3gb7Ov+O9tRH8WhhIpRx9wPl+JAOqoW8vkl09xvJNmnrDRDMcecbbXsognlvWTddt/kaDxc/6MjqkBgtGuLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FLOQTGFn; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FLOQTGFn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755871614;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p1OtBujDYhc4wh7yBHvledr0/XQqI3JjEgXQrd72WsM=;
	b=FLOQTGFnCtHIfGTKaN6/aN1rRCngm0j6SBHxnwxmSLnOoACJXdieeF1cf/6d58vMgpzoNX
	bPaQs/MEh78/oDP4HIMkozE7ZNhM4/f+a/GvyI36pHxC/GndJMyq6Hi2n8XToYzJcgpcm0
	NVPtg1bt1JIWzrxyVaRKXATtegT3Wp4=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-632-gzgd0F3ZNeON4HjQMJrGFA-1; Fri, 22 Aug 2025 10:06:50 -0400
X-MC-Unique: gzgd0F3ZNeON4HjQMJrGFA-1
X-Mimecast-MFC-AGG-ID: gzgd0F3ZNeON4HjQMJrGFA_1755871610
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-afcb7a5d28eso262978766b.2
        for <linux-staging@lists.linux.dev>; Fri, 22 Aug 2025 07:06:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755871609; x=1756476409;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p1OtBujDYhc4wh7yBHvledr0/XQqI3JjEgXQrd72WsM=;
        b=B9mc4CLpNUdQeqXdPY2zkgGjadwzW5kg3EmyDUb3ZpC3T1CYwdoi61gxj58CR9gK8m
         yT81gRkrElCFaNnXqks838zoH3UgJI+OJ+ZMed16QHT26+ayrxnCJqBTkaLkVdvKumFK
         YkP0dLAPZLd6NuURGkp2NgIJ3WUccDCXNhVFuJRFMzqviz1SX5nIRp3xkn1IxGDuG9Xf
         5RvHq8enWEOhVZMRSsRjp11PazLIwV/ncu2bMVTsoCHCujynYBP0/JEnZh3NNalVdR3K
         bUiZLErDmQLivfA2D/XCKuCBW0/b58AUtSkfx7woc5e5c3cbx+3A3Lf7F5Ocx9aLx1rO
         k7jg==
X-Forwarded-Encrypted: i=1; AJvYcCXY9DYSFKgUHPKoRdZhTECNbABGxq02HHYicRt1HgBpdiy2qIkqnK5kt5sRTEOiaw2ipJF9Ot+0qUdGwa9b@lists.linux.dev
X-Gm-Message-State: AOJu0Yw96HmU1c4Ov8ZcF8g4zQUbkJvdlOvWUfTXCRJ62hjn3ZwZXFYi
	haLwEKuAAnIe1zghHWD0ilt27eo8o5yk/8Z03m2EY2WZpvCiLuztqYIv57nqUx1I0ojr1/yHb4+
	PgwV0EprzWgGPWCh4GjHKAit9HmxXrh/8MKtQYbCBaAtvdf2lStZu9yPiGCB6RPhne70=
X-Gm-Gg: ASbGnct2sfEEuWkLiP0YVWQLw0nkMNfCPrEKoQVCNGJlk4q+bxhFfb/Bd17ybKN8pTb
	r9FXxGwE1aPYk2uQPBWC0SbTvDo6h6h5lI/xUbNfFfNi/QGF6pYon2+bQ0ZSrf3949sE7szSPb7
	DycV5o2urX65Jx3q2CrVJHItYmaeabZTb10v1TcAiI/KRDxvRIa/sNwzyraVRA41B4zBfsAG85d
	KiN8HZw75bAwxEOSgWpNCL4H8+PA9Kn7yU5PjDPd1w9luIClePPPQBAKGtetMElLA3S/fnmgimU
	6HNYyoAgMbAvCgh3bUQ11EG7svM2NTK8VCNFxvvQhf1sa4BWpU2BXOzibYGvJuE0UEkfWT0cZdH
	0LoyogxkBN3eHZsViG3tPZ4qsHNP6qSUZzh+lMFfdUrsw7EEn8IUIRpftJlxjVd/vovFcbE08hP
	OZs9vJ3KB01nrw5Lc=
X-Received: by 2002:a17:907:da15:b0:afd:d94b:830d with SMTP id a640c23a62f3a-afe29511c01mr308751666b.62.1755871609521;
        Fri, 22 Aug 2025 07:06:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHboT2GlNrHsmLimww91Bi0N9+TLQk4nVZ6Qvih+Ksmmum3mgf3/wMdYhvXw4qqO59SH8tsxA==
X-Received: by 2002:a17:907:da15:b0:afd:d94b:830d with SMTP id a640c23a62f3a-afe29511c01mr308748666b.62.1755871609090;
        Fri, 22 Aug 2025 07:06:49 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afe1367efbdsm308332566b.25.2025.08.22.07.06.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Aug 2025 07:06:48 -0700 (PDT)
Message-ID: <f383b86e-297e-4044-a0c0-8981b8a541fb@redhat.com>
Date: Fri, 22 Aug 2025 16:06:47 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/13] staging: rtl8723bs: get rid of os_dep/recv_linux.c
To: Michael Straube <straube.linux@gmail.com>, gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250822135418.118115-1-straube.linux@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250822135418.118115-1-straube.linux@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ajflMERWi2qiGQr4wrofopks_DT747uUSaafg2UkHJA_1755871610
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 22-Aug-25 3:54 PM, Michael Straube wrote:
> This series moves/merges the functions/functionality of os_dep/recv_linux.c
> into the corresponding parts of the driver in the core directory to reduce
> "os dependent" code.
> 
> The patches have been compile-tested only due to lack of hardware.
> 
> Michael Straube (13):
>   staging: rtl8723bs: remove wrapper rtw_init_recv_timer
>   staging: rtl8723bs: move rtw_recv_indicatepkt to rtw_recv.c
>   staging: rtl8723bs: move rtw_handle_tkip_mic_err to rtw_recv.c
>   staging: rtl8723bs: merge rtw_os_free_recvframe into rtw_recv.c
>   staging: rtl8723bs: merge rtw_os_recv_resource_alloc into rtw_recv.c
>   staging: rtl8723bs: merge rtw_os_recv_resource_free into rtw_recv.c
>   staging: rtl8723bs: merge rtw_os_recvbuf_resource_free into
>     rtl8723bs_recv.c
>   staging: rtl8723bs: move rtw_os_alloc_msdu_pkt to rtw_recv.c
>   staging: rtl8723bs: rename rtw_os_alloc_msdu_pkt
>   staging: rtl8723bs: move rtw_os_recv_indicate_pkt to rtw_recv.c
>   staging: rtl8723bs: rename rtw_os_recv_indicate_pkt
>   staging: rtl8723bs: remove os_dep/recv_linux.c
>   staging: rtl8723bs: remove include/recv_osdep.h

Thanks, series looks good to me:

Reviewed-by: Hans de Goede <hansg@kernel.org>

for the series.

Regards,

Hans

