Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05FC770
	for <linux-staging@lists.linux.dev>; Thu, 29 Jul 2021 16:47:48 +0000 (UTC)
Received: by mail-oi1-f171.google.com with SMTP id a19so9247741oiw.6
        for <linux-staging@lists.linux.dev>; Thu, 29 Jul 2021 09:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=WByKALSH2u96aeeXWsaLJQnIIah2Zq4+6oOOD+AQHTY=;
        b=CtY2tWmzEjc7d+wiaKiRgxdKYEf52ep9Zd4FBuhH46+795nlGmDqM50Do1fzXDz/t7
         KzEaCyuCdbsfjd/j+vDVVGy679kJmJ6tmyHZmx2SDHhKkfK34sf9yDtCaCKPhzUNgSRD
         jkzPxKYMyZAnG4lgXgUgTrCm/5wKaPDj3nVSGI1avUHFBkzFoLqQMF5+XmEV6HSSjaay
         SP/idGu4cZkr+9SCceIx929PTJpm3HJpsiHVZqgEzOrifU2gWIThnzMLAfI9Rt0Y60gM
         ehTbACjAIhVoqlaXzzPFvj0BrYPTUQi8SxSPAHqk7HsLjOSajebhqMwd3F/KztuZGpbz
         0LVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WByKALSH2u96aeeXWsaLJQnIIah2Zq4+6oOOD+AQHTY=;
        b=GWFcb9DVXS5Ji3c0dOownpeivwRNL6O2AQa+isNw/4auHAEjkGMGmlhm/yA6Ii5KwZ
         rYNypKTF+Eq9D28lvmKtvGvgJRG1NDx2TJjzFqW/SPSWneojHDI7aAEF1y1vTWKwXpSD
         BLD66re5oBdBZ51tvEO6AtgJD+fm8WraINeRYTXAtEwRX7G3YuILA7F4VVPhveLHOkFk
         t4EfLJBNqZ71//e2sbe1nCgUrbNAamrjBNv4LmTOhFOk8lHjCz86NgxXaendOkYwuSoV
         YV49W5WBIM97ObhykzaqLUoCYIHx6+fJSG77Zcj+KQkopEtoGPJJ6/9xIIUEqSN86sLT
         +0EA==
X-Gm-Message-State: AOAM531tWe5LYDrOsRPM5D+UhTlu6Y51uxyzMh/uuz/1FmsMkXuyCdMq
	G5JI0/Ub5i0WtT4y7XBecGk=
X-Google-Smtp-Source: ABdhPJxVv8ZSeD6e+G/dL4Y956ZzVqxMdEZwzp0FEWvy2r2sn06pb40kdU98XiDxuymXmY8cBJW9rA==
X-Received: by 2002:aca:3094:: with SMTP id w142mr3656047oiw.37.1627577268137;
        Thu, 29 Jul 2021 09:47:48 -0700 (PDT)
Received: from 2603-8090-2005-39b3-0000-0000-0000-100a.res6.spectrum.com (2603-8090-2005-39b3-0000-0000-0000-100a.res6.spectrum.com. [2603:8090:2005:39b3::100a])
        by smtp.gmail.com with ESMTPSA id a24sm617069otq.72.2021.07.29.09.47.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jul 2021 09:47:47 -0700 (PDT)
Sender: Larry Finger <larry.finger@gmail.com>
Subject: Re: [PATCH v4 0/6] staging: r8188eu: add newer/better RTL8188eu
 driver
To: Martin Kaiser <martin@kaiser.cx>, Phillip Potter <phil@philpotter.co.uk>,
 Greg KH <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@oracle.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-staging@lists.linux.dev, Fabio Aiuto <fabioaiuto83@gmail.com>
References: <20210727232219.2948-1-phil@philpotter.co.uk>
 <20210728074605.pp5rs4c65tofnqot@viti.kaiser.cx>
 <CAA=Fs0mH9YAVhr24YeE3jpZrnuDGhOuhj=Sb9Ekkpb-xoC5LYg@mail.gmail.com>
 <20210729133730.lnxqzawnvksp4skg@viti.kaiser.cx>
From: Larry Finger <Larry.Finger@lwfinger.net>
Message-ID: <1d687d5f-d514-655a-f8bf-a5bac321affb@lwfinger.net>
Date: Thu, 29 Jul 2021 11:47:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210729133730.lnxqzawnvksp4skg@viti.kaiser.cx>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 7/29/21 8:37 AM, Martin Kaiser wrote:
> ok, understood. That's an important feature. I see that Greg accepted
> your patches, there's no point in arguing any more;-)
> 
> Greg and Larry: Would you mind sharing your ideas about getting
> rtl8188eu support mainline? Do you imagine that we clean up this driver
> until it can be moved out of staging? If so, we'd probably have to
> resolve name conflicts with other realtek drivers and rename lots of
> functions. Or would a cleanup of the new rtl8188eu driver be a
> preparation for adding bits and pieces of it to rtlwifi?

Martin,

I do see this driver being cleaned up to the point that it transitions to mainline.

It is not clear to me that it would fit into the rtlwifi framework. It probably 
could use the USB driver there, but unlikely to use a lot more of that code.

I will certainly be on the lookout for conflicts with the rtlwifi and rtl8xxxu, 
indeed the whole drivers/net/wireless/realtek/, code as the cleanup proceeds.

Thanks for your concerns and questions.

Larry

