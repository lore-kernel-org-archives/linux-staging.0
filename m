Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4729A7B
	for <linux-staging@lists.linux.dev>; Sun, 20 Feb 2022 16:20:44 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id o9so11338461ljq.4
        for <linux-staging@lists.linux.dev>; Sun, 20 Feb 2022 08:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=sd+XJEjoSk98m94XHap1yquvW+LhGst3/uvY4pex7eY=;
        b=CUU6jJZ59N80XBO9QMe3zzHcDlslYWwHcHUQuhy1naHQ6ceuEyX6viGzkhGwANpZO1
         Cx/Jzb6uiVaqcl8PE1MYieWd0r49rQVXrmISXDm+5SJuYZcagzlerPTBNn4hz0nuXJ7O
         g9X4ZKdRCgzYWaSKIk2dx3We4FEhvRZihEqfXPgr5YYKLwdepw8ijcfnS+ZBrXzYxeiq
         VLaSQ/Bsmq450iA1E/NBFBaCijTgMgJMhOhgijuHY3w2GMkEy4kip8kduTuh8Lv8+x+M
         r9n4Ts1Yljzx1IDk9hLt3zV/YLYXyy2qC/wuZwFylnpAmk5UMCEaURHMEjPeeJhq6Q+t
         sNdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=sd+XJEjoSk98m94XHap1yquvW+LhGst3/uvY4pex7eY=;
        b=4IEa64tZt5hDbJOsxGsqXeOGie2zDwtxbANgdrXTmeYRIyk899eOKHfM8+4gaH+4V5
         z+q0JVa6a1glG5ZwV87PvtaHEKMdHtm4zG9uj+WNHviqmV2bzDjcWM4uBhT+kngcMXp5
         /IGUrzn5pv8jIaeo1wnRX2lIul/vLYTYj2cvxjq0xVizJ91/BdbcuYY/UTVSMoitWD36
         pAqNPHn0bZTN9qF8LgAXMCLJ+GDoR0cdiAgScASjRJ31DxgFgrVXMcv7EwxELQwx5VzE
         uqUrkJF0QsN14jr/fNLoiFJBC9DMQekIiSrNVIdRBOSQ5WVhIv1rNRN12ipHkQ6fHRdK
         HhTw==
X-Gm-Message-State: AOAM533gxpH2G6itSV7ONGgJJAVugZrZrb1D9OyoWCYzmzhfu8CDdwg+
	ay3a5FaZLUHle7dczmjQ/5o=
X-Google-Smtp-Source: ABdhPJxsetL+pqqLUYYVdIzCRdgBnVRU8O+CpeOX+YgF2EGcqlIfAmc7XTewMg9KJdrBuDQYtlRHyQ==
X-Received: by 2002:a2e:8890:0:b0:23d:1f76:aa with SMTP id k16-20020a2e8890000000b0023d1f7600aamr11835511lji.222.1645374042225;
        Sun, 20 Feb 2022 08:20:42 -0800 (PST)
Received: from [192.168.1.11] ([94.103.229.64])
        by smtp.gmail.com with ESMTPSA id m8sm1040813ljb.131.2022.02.20.08.20.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Feb 2022 08:20:41 -0800 (PST)
Message-ID: <cb7db1ac-8e7e-d549-a5c0-fcd072ae815e@gmail.com>
Date: Sun, 20 Feb 2022 19:20:40 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH 2/3] staging: r8188eu: refactor rtw_ch2freq()
Content-Language: en-US
To: Michael Straube <straube.linux@gmail.com>, gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20220220154847.7521-1-straube.linux@gmail.com>
 <20220220154847.7521-3-straube.linux@gmail.com>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <20220220154847.7521-3-straube.linux@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michael,

On 2/20/22 18:48, Michael Straube wrote:
> -static int ch_freq_map_num = ARRAY_SIZE(ch_freq_map);
> -
>   u32 rtw_ch2freq(u32 channel)
>   {
> -	u8	i;
> -	u32	freq = 0;
> -
> -	for (i = 0; i < ch_freq_map_num; i++) {
> -		if (channel == ch_freq_map[i].channel) {
> -			freq = ch_freq_map[i].frequency;
> -				break;
> -		}
> -	}
> -	if (i == ch_freq_map_num)
> -		freq = 2412;
> -
> -	return freq;
> +	return ch_freq_map[channel - 1];
>   }

What if channel has wrong value? The old code returned some default 
value, but with new one we will hit OOB.





With regards,
Pavel Skripkin
