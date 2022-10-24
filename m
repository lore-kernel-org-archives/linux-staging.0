Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89308369;
	Mon, 24 Oct 2022 03:08:04 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id p3so6469488pld.10;
        Sun, 23 Oct 2022 20:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BlsZmEBE21p9J1jMFwhL5ri5TBwNvQhqBK5ytJSYJNk=;
        b=axB0IjFEDVR6dbNTgYOFuzAyK/SNlsxQEu6r8aXiVSPhG7mHWUm9Gl18SqT83cmBgs
         oGTd1DGHMUG2SZscDAOLWD98jyKfPI3w0jK35w0XABYCs7+6LMKEeCMFDQUPYfGptJ8S
         94UTc+O/r97wmrrzbyOljP+Tpt7XpIgjveO16L5sU9m/Bm3j6lXvMJ7dX4R+wCyg9xuC
         QCOJ9Tip/yCON7pJo9l7oCBLZCMmTZyjewH8e1scav4avMCZlWEEk8zt4MaIhmcAyadL
         OQmSp62FRDDNLh7Re+NQ4A13BJN094L9V7hESFhDfmqF3Xj2fEGGoGFHfbqramJsCZJf
         XQug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BlsZmEBE21p9J1jMFwhL5ri5TBwNvQhqBK5ytJSYJNk=;
        b=Vhsb8NDXXqjlAft/ggkm5ZREaHP8s4dTs5Jr7/BO0At4w0HbdJSOefLqMsngpEuIm5
         fFKmOh9XWbzGOcu9m6ZxSkJOWRMmMCqtkxw4HhX38ewRxHi/ZKjOuj2flzOWRE8BrdWt
         zrIx94oFVIzNAkl9CnSovCbt94NRS89a/wD7WMpvzJDlF7JDqqXodhiAWM47KkDtk1xS
         K/C+APhyHbOF4zUHau6WcY/GBoRd6goZaWtOVSve5/UH88OK/0bGI4ZhIy1zO9EBUIQJ
         02kgaSLs7XD31CNGad9amk2MvZ+8ZCDr93DSn2iRk3yEMQ23YbofkXHszvnvjulAOc0D
         IACw==
X-Gm-Message-State: ACrzQf3QX9vo7rMfhbfEDZIC8DH2HuJ6v9MwFc/M7AqehXfLqWs2Q67V
	nPyDCRyTlYCFQva9kKEKfSA=
X-Google-Smtp-Source: AMsMyM5cfElJsXwV17L8hG7UuzpLA7oOodxswudFsdwqyxQdh7SWr46WyfoAtbliaewFPhzl02V3fw==
X-Received: by 2002:a17:902:e94f:b0:17f:6df3:1a99 with SMTP id b15-20020a170902e94f00b0017f6df31a99mr31495772pll.20.1666580884016;
        Sun, 23 Oct 2022 20:08:04 -0700 (PDT)
Received: from [192.168.43.80] (subs02-180-214-232-9.three.co.id. [180.214.232.9])
        by smtp.gmail.com with ESMTPSA id z7-20020a170903018700b00172e19c2fa9sm18771163plg.9.2022.10.23.20.08.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Oct 2022 20:08:03 -0700 (PDT)
Message-ID: <4863c6d7-ffdd-1304-981b-9b0644a87f4e@gmail.com>
Date: Mon, 24 Oct 2022 10:08:00 +0700
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v2] staging: wlan-ng: remove commented debug printk
 messages
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Deepak R Varma <drv@mailo.com>, outreachy@lists.linux.dev,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <Y1L0FiKvrM9jjZG9@debian-BULLSEYE-live-builder-AMD64>
 <Y1VDM2kWIi1I5dqI@debian.me> <Y1VL/wITM64U6qLi@kroah.com>
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <Y1VL/wITM64U6qLi@kroah.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/23/22 21:13, Greg KH wrote:
>>> @@ -1007,7 +986,6 @@ static int p80211_rx_typedrop(struct wlandevice *wlandev, u16 fc)
>>>  			wlandev->rx.cfack_cfpoll++;
>>>  			break;
>>>  		default:
>>> -			/* printk("unknown"); */
>>>  			wlandev->rx.data_unknown++;
>>>  			break;
>>>  		}
>>
>> Shouldn't these printks be guarded under CONFIG_DEBUG_KERNEL instead?
> 
> No, they should just be removed as was done here.
> 

What if in case of debugging without these printks?

-- 
An old man doll... just what I always wanted! - Clara

