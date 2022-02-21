Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E5220E7
	for <linux-staging@lists.linux.dev>; Mon, 21 Feb 2022 19:41:25 +0000 (UTC)
Received: by mail-oi1-f178.google.com with SMTP id p15so12027960oip.3
        for <linux-staging@lists.linux.dev>; Mon, 21 Feb 2022 11:41:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=WCBQPRAXNKEOqzap7VzxRpf2OcOGWxCXupmF+QqH0S4=;
        b=O1R9sTehWUO2FhfEhPLXFpuRRGqs/4WmmT9xIlNb2dZMdG7/haGYG3VL2aLpjbZsVZ
         scnGpQJ9Fk7D+AWCZ+w6mqepFjaGSHRSRXJHO5+atd3kI9ipJdSTnC5aEHjC7+XVV/WM
         qQKeVkCM66N+2oi9vJoEw1aBldeGQ1z/p+JaGHGxuvBqhdhoWpRpvMbJaTMHhOAruoFF
         tvnW0MvTycN2WYoeqtj3I09TAOU489NJ1JmMqmSXEyWIg4rVCxaV0OqtwsVKx76q9vQv
         KcHRPMDuPaCiz4Gjc0DT+mmxtG8UxlpFJlHcJrl5ZVDTp5R75gRZ4+aN5cltMIUvY0mK
         qLuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=WCBQPRAXNKEOqzap7VzxRpf2OcOGWxCXupmF+QqH0S4=;
        b=LFf99PzUGYXlc/W195inF7Ge7YHa8ajTluOeS9G/VDZha8xSAmQvDCo6n2hJMDtuvb
         rSVll59YgiUmWI0TrP/J2a9Pqg/rAzfvF3MT5sgZHgnqf9/LjOw9DHFH3Dbb/59L7C58
         YngpH50qAyP4jJQt1Y2YNrxKSP8MQi14uYKJzzaHbO++j6vvn/E5QBvJZVfV57E0BUko
         NJYOxqcnJOZgt7Yg2arOv6afs6TveNrFHlD8qrXPA59XAOwjqzgQ1cWLyc6k6u21TF0w
         Y6Ds6PJ2741O0DecyWhupZA7oLUPOVhnMj7PqPJ5OzRVkn85vAdcEXvxzJ9ULdJfS1/v
         8KBA==
X-Gm-Message-State: AOAM531KE0AlbaL155CMRQAC7WW/kw/4GHFRRgmte4bsDIlc/dVyzM27
	qNkHCB/wm0kV2+uGUM/Jums=
X-Google-Smtp-Source: ABdhPJyY3RwwLjtVarsQbG1GDAZuK+UWddBx+8ANkuGv/PX2m0IBeVPkij3YJ16Z2iJ3BHsdQ/JWAg==
X-Received: by 2002:a05:6808:30a7:b0:2d5:2957:f98e with SMTP id bl39-20020a05680830a700b002d52957f98emr283339oib.183.1645472484838;
        Mon, 21 Feb 2022 11:41:24 -0800 (PST)
Received: from [192.168.1.103] (cpe-24-31-246-181.kc.res.rr.com. [24.31.246.181])
        by smtp.gmail.com with ESMTPSA id b16sm4801662oti.69.2022.02.21.11.41.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Feb 2022 11:41:23 -0800 (PST)
Sender: Larry Finger <larry.finger@gmail.com>
Message-ID: <636080dd-ab8d-a572-0f81-5f72b14ec1e4@lwfinger.net>
Date: Mon, 21 Feb 2022 13:41:22 -0600
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 1/3] staging: r8188eu: remove 5 GHz channels from
 ch_freq_map
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>,
 Michael Straube <straube.linux@gmail.com>
Cc: phil@philpotter.co.uk, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20220220154847.7521-1-straube.linux@gmail.com>
 <20220220154847.7521-2-straube.linux@gmail.com> <YhPIVFmStJOMI0QZ@kroah.com>
From: Larry Finger <Larry.Finger@lwfinger.net>
In-Reply-To: <YhPIVFmStJOMI0QZ@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/21/22 11:13, Greg KH wrote:
> On Sun, Feb 20, 2022 at 04:48:45PM +0100, Michael Straube wrote:
>> This driver is for chips that operate only in the 2.4 GHz band.
> 
> How do we know that?
> 
> thanks,
Realtek 
(https://www.realtek.com/en/products/communications-network-ics/item/rtl8188eus) 
states the following:

"The Realtek RTL8188EUS is an 802.11bgn 2.4G single-chip that integrates 
Wireless LAN (WLAN) and a network USB interface (USB 1.0/1.1/2.0 compatible) 
controller. It combines a WLAN MAC, a 1T1R capable WLAN baseband, and WLAN RF in 
a single chip. The RTL8188EUS provides a complete solution for high-throughput 
performance and low power consumption integrated wireless LAN devices."

The reason there are 5G snippets in the driver is because Realtek uses the base 
code to generate drivers for other chip families such as RTL8192DU that have 
radios for both 2.4 and 5G bands. The RTL81288EU and variants have only a single 
radio.

Larry

