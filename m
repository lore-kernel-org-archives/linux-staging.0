Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3972C80
	for <linux-staging@lists.linux.dev>; Wed, 20 Oct 2021 15:56:21 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id o24so12630469wms.0
        for <linux-staging@lists.linux.dev>; Wed, 20 Oct 2021 08:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=uqT1+bpO5GtTAP8kk5EhhjPAS0dVX5h+L+bMjzTPiks=;
        b=cEtB6xSBPm7ST6GkvnB078hot11IthI5rZs3+CQtixOEi4fr82nqsPAEVmThIQf5Ex
         c3SpfkdSOkWM0kh1zVUOkre2FPT9SD+2oOSDTHrJDDg+WcfsvdoBQQ8Oa/WnRAIEaC+e
         dHgBI/x+tc1/iL9lAiRc9V5lE/b44f+h40y4oifolKaBQ5B3y8YM2tX6vjFTuZRBfNQc
         /FOMrr/GCT7E3Yn41vovi94RBCpbHbqAjBMS2kqoE87S31/hcJGsJTaO0Guk04uvFg+p
         egz/MvfAZmI3/4lrBu4Nk7PD5tho6I/FhQzD1suV8GbbGrQNr+wddfF7t+fKa0tSvrCy
         SLng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=uqT1+bpO5GtTAP8kk5EhhjPAS0dVX5h+L+bMjzTPiks=;
        b=MfOUv9r8KPey4a6KxYkGBPIpJa2ppsSz39WNdU71+n0P6kZBLHHO7yekcqv8G29X3y
         hlXr90lVmPhwIoKEqKDTLBmotZe2KogWq/5NClHVYLZeygMU2bkxkJTlxvtxcCFG9VqS
         iM/kCHWfSVEl5LG46iPDnqbik9knOeRgPy7QBPg3lZHNGtf3eLzUARWK8QZhrcBgz9FK
         iqlDHmosUE/08I8ncVSYo3PgCCzvaoicReclDhQ+t2E5FWvQOJPhhgtT0kIDkTtDElR8
         +ZQo4sxNTgWbAAporXfoBVA/ele+ynyBQE3isy4HN9jIrho3J5TXVzOUEGsxZHZLUJhN
         Uhdw==
X-Gm-Message-State: AOAM533TVwaO5b7c9d2Wi/we/ukA2S/5QoLI3HsmxVOTJEJCYqVaJWTE
	hFSeOI7ABUq4No32Eohg/v0=
X-Google-Smtp-Source: ABdhPJyiUgOgF6jQnNnDfJUeWb7xBfoZngJJN4yGWDjKblUiSgU4uug1c8P5TV38NDu6qasoEcN0yg==
X-Received: by 2002:a05:6000:1567:: with SMTP id 7mr42183wrz.408.1634745380064;
        Wed, 20 Oct 2021 08:56:20 -0700 (PDT)
Received: from ?IPv6:2a01:4b00:f411:e700:e085:8cb7:7bf6:5d62? ([2a01:4b00:f411:e700:e085:8cb7:7bf6:5d62])
        by smtp.gmail.com with ESMTPSA id g10sm2877383wmq.13.2021.10.20.08.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Oct 2021 08:56:19 -0700 (PDT)
Message-ID: <596fba87187b73277fd5c1102baa1815ed8fe4f8.camel@gmail.com>
Subject: Re: [Outreachy kernel] Re: [PATCH] staging: vt6655: Rename
 `dwAL2230InitTable` array
From: Karolina Drobnik <karolinadrobnik@gmail.com>
To: Julia Lawall <julia.lawall@inria.fr>, Joe Perches <joe@perches.com>
Cc: outreachy-kernel@googlegroups.com, gregkh@linuxfoundation.org, 
	forest@alittletooquiet.net, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Date: Wed, 20 Oct 2021 16:56:18 +0100
In-Reply-To: <alpine.DEB.2.22.394.2110201615590.2930@hadrien>
References: <20211020132811.417341-1-karolinadrobnik@gmail.com>
	  <16db455b46f130300b5c346160aa434616e4f6b4.camel@perches.com>
	 <157ee66fd0e3304c238e7ad8123277892e0d1132.camel@perches.com>
	 <alpine.DEB.2.22.394.2110201615590.2930@hadrien>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Wed, 2021-10-20 at 07:09 -0700, Joe Perches wrote:
> On Wed, 2021-10-20 at 06:44 -0700, Joe Perches wrote:
> > In this file there are more than 100 uses of
> > 
> >         (BY_AL2230_REG_LEN << 3) + IFREGCTL_REGW
> > 
> > Maybe add a define for it and substitute the uses for the define.
> 
> Look at the code too.
> 
> It looks as if every use of IFRFbWriteEmbedded() has this added to
> the 2nd argument and that the 2nd argument isn't used anywhere else.
> 
> Maybe remove it altogether and add it to IFRFbWriteEmbedded().
> 
> And it looks as if the + uses for these should logically be |

Sounds like a very good idea. I'll add it to my to-do list, thanks :)

On Wed, 2021-10-20 at 16:16 +0200, Julia Lawall wrote:
> Karolina,
> 
> If more than a hundred such changes are necessary, you may find
> Coccinelle
> useful:  https://coccinelle.gitlabpages.inria.fr/website/

Hmm, I'll check this out, it may come in handy.


Thanks,
Karolina

