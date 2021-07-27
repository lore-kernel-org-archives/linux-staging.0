Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4387168
	for <linux-staging@lists.linux.dev>; Tue, 27 Jul 2021 22:30:48 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id o185so1177453oih.13
        for <linux-staging@lists.linux.dev>; Tue, 27 Jul 2021 15:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=TM+0hfl782kZ94bU2+mpLOzzj7zbvQhOg+LQO69XhJk=;
        b=OnZ0m3U6tk3aCgWWTpT1MeD5/y+cwwRGzbM1zoIOCsQa4Vm9x21ssaUT8KnrIx+bhB
         Wa4U8xGQ285YoMNgnePTt2oCAcFoa8EIx3hrP27YcLLsbYrem2nEpOrbnmPnPX0ir/Ic
         V51k/BxJeVFK/eNOf91oJ90M75vlYzafc5fjuq+9/rO8ZtxNzXPK1thYL0Dwh0Tn2olv
         SivSSSssPuoXELYpGRGeF7OTsoxb6Cx0zu/1/SiPhOUEi34dJjExAZbJyPC9Z46LMBVp
         AhzMesAzkabVEr5OAd/P4rBe8czDEUBkikopbW0OPFtJ2NPn2COjgAV4AOGkH4MMFPaQ
         1nfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=TM+0hfl782kZ94bU2+mpLOzzj7zbvQhOg+LQO69XhJk=;
        b=HeqfKivedJQZbEI1sfg2oq6A/vEbEl6rktUu7aFz4iqlxZFlvqdYjb7RdjtLM4+q+t
         eqVj42IrUFV5up2wQpHgy3DqIdaXmAvQwgh73XK1l5JU9hwK12IV7ixGbvn4OcvwGB3I
         2/PnUNL5UVRtNhfWNe02B8kouYLuXCxAxesVj8hxzILsJVAFAVzmf9mZVX/9f2KZt4dL
         GeCgfuPgTD2YhyYXxJtDGuI6UzpRS42MfzEQHQmQrWuQRGUI2KjnXLY57VmJhm1o4Wiw
         n8zoxxnqMLKRLbxy71t/PVKZ643ZbiK2MZt0mr5E7YgTVEPU3F9q6KbpBncwMbkyzF2Y
         VfIA==
X-Gm-Message-State: AOAM530cD2zF+Dxeo+XKwzoO3BRdRLDOpFcWnnZnOpA7h8jfbYlYMJ7l
	cBvUUkOmwITscrJ1aAw7nyI=
X-Google-Smtp-Source: ABdhPJz1wrwXjwcPUI1kIk1ky0ig9jrAicZ/h11+lv2H2/uL4SXlKLhoPqS89RPsBt2E7Mkq8bcgCQ==
X-Received: by 2002:aca:d505:: with SMTP id m5mr4174267oig.5.1627425047828;
        Tue, 27 Jul 2021 15:30:47 -0700 (PDT)
Received: from localhost.localdomain (cpe-24-31-246-181.kc.res.rr.com. [24.31.246.181])
        by smtp.gmail.com with ESMTPSA id c16sm783982otd.18.2021.07.27.15.30.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jul 2021 15:30:46 -0700 (PDT)
Sender: Larry Finger <larry.finger@gmail.com>
Subject: Re: [PATCH 07/64] staging: rtl8192e: Use struct_group() for memcpy()
 region
To: Kees Cook <keescook@chromium.org>, linux-hardening@vger.kernel.org
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Keith Packard <keithpac@amazon.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-staging@lists.linux.dev,
 linux-block@vger.kernel.org, linux-kbuild@vger.kernel.org,
 clang-built-linux@googlegroups.com
References: <20210727205855.411487-1-keescook@chromium.org>
 <20210727205855.411487-8-keescook@chromium.org>
From: Larry Finger <Larry.Finger@lwfinger.net>
Message-ID: <fa3a9a2f-b611-7fe4-9359-88fa51239765@lwfinger.net>
Date: Tue, 27 Jul 2021 17:30:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210727205855.411487-8-keescook@chromium.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 7/27/21 3:57 PM, Kees Cook wrote:
> In preparation for FORTIFY_SOURCE performing compile-time and run-time
> field bounds checking for memcpy(), memmove(), and memset(), avoid
> intentionally writing across neighboring fields.
> 
> Use struct_group() around members addr1, addr2, and addr3 in struct
> rtllib_hdr_4addr, and members qui, qui_type, qui_subtype, version,
> and ac_info in struct rtllib_qos_information_element, so they can be
> referenced together. This will allow memcpy() and sizeof() to more easily
> reason about sizes, improve readability, and avoid future warnings about
> writing beyond the end of addr1 and qui.
> 
> "pahole" shows no size nor member offset changes to struct
> rtllib_hdr_4addr nor struct rtllib_qos_information_element. "objdump -d"
> shows no meaningful object code changes (i.e. only source line number
> induced differences and optimizations).
> 
> Signed-off-by: Kees Cook<keescook@chromium.org>

Tested-by: Larry Finger <Larry.Finger@lwfinger.net>
Acked-by: Larry Finger <Larry.Finger@lwfinger.net>

Looks good.

Larry

