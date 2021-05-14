Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72AFB71
	for <linux-staging@lists.linux.dev>; Fri, 14 May 2021 09:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1620983747;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BpfRmI9P4vpehWleRJqjHOmgGFaPys7I5ZwjGCPC8aQ=;
	b=YNkeGtBM3ndvmabk1nS8C8yWsI1E1/DoOe/Ew1fxNxGt6trbknAlu06o4+bfxy0t/+i3Yp
	yTHEgJ82GRB0AgJ6On9yPMuvE4aR014VWQuhUAy+gFr2ORk1toPhRyZJZ64KnGrHyfo3yC
	fQOy5AxZ8zJhnHRAQtlg3cKHdoy+ZP8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-S1eHpTYENgCai0127OgM1A-1; Fri, 14 May 2021 05:15:44 -0400
X-MC-Unique: S1eHpTYENgCai0127OgM1A-1
Received: by mail-ed1-f70.google.com with SMTP id o12-20020aa7d3cc0000b02903891695ceabso16070095edr.3
        for <linux-staging@lists.linux.dev>; Fri, 14 May 2021 02:15:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BpfRmI9P4vpehWleRJqjHOmgGFaPys7I5ZwjGCPC8aQ=;
        b=K3Ir0XVgrPw65RQ0/ey7Qo61jVobB6b32ZlDOK1stHS2wG9kqqb2DLdtB4oZr+y9F/
         l74GTFvNyyfeFYRZNvXIdGUujwWv/IcnSOL5wIMZKiCowi6HvSmM5pmggvpV1SmAyu8d
         YhUOpKVbwQXS3+D5x6k8eJ1yXRdew16rcDxHH6dSff5au7ayQLT3eVloKzvEXm7rQvzY
         l76TQMRZH20iuzqpu+Yme0P0uRuwdcIHyyE6X0fbLXl33sEUWALF7SQtZrbQleuNYWL0
         ednT9sn+2iNoIzrN3UaqkjajnDjEQLfB8sUh+BR0fAAC/J2Bbkts4a2VGn8T/xhx49BS
         I2ig==
X-Gm-Message-State: AOAM533/AqOBSppBhp8HusIiXLuHg4o+RRYlVztT9eRBoIOCw7tIJcuA
	WvR4mKCGIUDbwB5/AY2LrDsxCVX/2fnP1cAIic/oUYNV6iahNjlv7a8n1VHBmH/WhszRlskuKKU
	d9I3TYsHCjgciVxbFEXU2uC6kIQ==
X-Received: by 2002:aa7:cb92:: with SMTP id r18mr25003681edt.246.1620983743760;
        Fri, 14 May 2021 02:15:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxQ8XBJjpDWLZwgoWpmzak+tn+JZuVO/zyIeMeJ58TsdHn5b32zLxEJOmdkQD1gk9IOCwbEaQ==
X-Received: by 2002:aa7:cb92:: with SMTP id r18mr25003668edt.246.1620983743639;
        Fri, 14 May 2021 02:15:43 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id nd36sm3138539ejc.21.2021.05.14.02.15.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 May 2021 02:15:43 -0700 (PDT)
Subject: Re: staging: rtl8723bs: questions on TODO list
To: Fabio Aiuto <fabioaiuto83@gmail.com>, gregkh@linuxfoundation.org,
 Larry.Finger@lwfinger.net, youling 257 <youling257@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20210514083856.GA13800@agape.jhs>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <85289dbc-e986-9beb-f7d6-eca9e8750c8a@redhat.com>
Date: Fri, 14 May 2021 11:15:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210514083856.GA13800@agape.jhs>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Fabio,

On 5/14/21 10:38 AM, Fabio Aiuto wrote:
> Hello all,
> 
> I'd like to have some clarifications about rtl8723bs driver.
> In order to make this driver ready for moving out of staging
> I would like to know:
> 
> - find and remove remaining code valid only for 5 GHz. Most of the obvious
>   ones have been removed, but things like channel > 14 still exist.
> 
> is it possible to remove all 5g code, even the one related to power
> regulation when on band 5g? As far as I know about this card is that
> it doesn't support 5g, so may I just delete all 5g code or there are some
> constraints I'd take care of?

These cards are 2.4G only so any code of which you are sure it is for
5G only can be removed.

> - find and remove any code for other chips that is left over
> 
> Ok this seems clear, are there some suggestion to do it safely?

Get some hardware and test that things still work, preferably
against multiple access-points.

> - convert any remaining unusual variable types
> 
> Ok (but feel free to suggest anything)
> 
> - find codes that can use %pM and %Nph formatting
> 
> Ok (but feel free to suggest anything)
> 
> - checkpatch.pl fixes - most of the remaining ones are lines too long. Many
>   of them will require refactoring
> 
> Ok
> 
> - merge Realtek's bugfixes and new features into the driver
> 
> Please, can you explain what one could do that?

I know that "youling 257 <youling257@gmail.com>" is using a different
version of the original (out-of-tree, non cleaned-up) Realtek driver
code for the Android-X86 kernels he works on. You should probably
ask youling why that version is being used and try to get a copy of
the original Realtek sources on which the staging driver is based
and do a "diff -ur" between them and see what is different.

> - switch to use LIB80211
> - switch to use MAC80211
> 
> I think I need a few details for these last points as well.

I'm afraid I cannot help there, you should ask for help with this
on the linux wireless email list.

> Do you think that one will need real hardware to complete
> these tasks? I don't have rtl8723bs card at the moment, so
> I think I will focus on those TODO activities which
> don't need it.

Yes you really do need hardware, even simple coding style
cleanups are known to (accidentally) break driver functionality,
so you really should ensure that you are capable of testing your
changes on real hardware.

Regards,

Hans


