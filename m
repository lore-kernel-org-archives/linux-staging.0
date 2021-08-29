Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F012FAF
	for <linux-staging@lists.linux.dev>; Sun, 29 Aug 2021 12:08:27 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id j12so20453518ljg.10
        for <linux-staging@lists.linux.dev>; Sun, 29 Aug 2021 05:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=o+swTcS+LZnxIermaKa3LHQgsSD1cR5lC/MsDCKUum4=;
        b=aYxv1Rj/ABPzkGnAcW5pKXkr02VN5YLA0N/YNOj601SA4oIHrGQ+PeajV0okIaQpSR
         TihF223KlVKNF7nwT5nDMa4C/umw81xwM+tRuCIkufYXl/Q2JaeP6MpCt3Bi+DLLipEU
         gEcTUYOzsXn1k2JgkJdt4pkDeEZzBOBQ/9mylCwbAQdKQ+PetXdbsMDfNCE8z6kCOv01
         93Qc5qHnz2BEqBsDMkBp2uWHKdGbQJJ1OoQc+5wpQqWYNKs077zZqyyjlJEAoBo+xmAB
         bHdxf7UldqVjntC8J01XMrnUOFP6fHExWT2rN6YDZqZEbStV/QWpnfZAqN0ETH4Ncg8e
         JAuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=o+swTcS+LZnxIermaKa3LHQgsSD1cR5lC/MsDCKUum4=;
        b=JYcmRpfj+uEuUxPYQHhK1OWdHpQi96aFvkF1dFVamOEqnB+re0TqP705DJB30vttPw
         IoBWFoKA4Sj+FXWjJFPD6wDnxpOh5KJdMnqeU+BhE8YH/5wpsT7cw6aDQTX4nhoICKc/
         srV0oCp0gbCXTNx8tMAVwLm0KeIj8NhS7E/443W0CXyMeWQPMXHx8im32Ulb60sBoI8w
         vgvQCEfVV6Jplyjr+yd8aj8FsZKzA+qfclF9lp4sIpyOHGW47aKKhw2lytTg488Yx0Dw
         ikuyw/XepAJCKyEhUgrTRbV07d+2O7mIby062E2IGlcb0gFdHZPO2Nx59hQwuDCslXyT
         cUiw==
X-Gm-Message-State: AOAM531t6uehS9APNujvvqD7CR47AHItgnCyEJu1raawNEwYFBMoW6RZ
	CkJ/OKVoE/M9XPnKbSSKtjk=
X-Google-Smtp-Source: ABdhPJzAPB8Uuo7S9K+anDDhJ0eV46NDeetCK3i/JuyKL1vecUOdBoe4QcwF8c/Cm1XmC3Lkgola7g==
X-Received: by 2002:a2e:9b14:: with SMTP id u20mr16102304lji.21.1630238905641;
        Sun, 29 Aug 2021 05:08:25 -0700 (PDT)
Received: from [192.168.1.11] ([94.103.229.213])
        by smtp.gmail.com with ESMTPSA id a3sm1421362ljj.122.2021.08.29.05.08.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Aug 2021 05:08:25 -0700 (PDT)
Subject: Re: [PATCH] staging: r8188eu: core: remove condition with no effect
To: Saurav Girepunje <saurav.girepunje@gmail.com>, Larry.Finger@lwfinger.net,
 phil@philpotter.co.uk, gregkh@linuxfoundation.org, straube.linux@gmail.com,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: saurav.girepunje@hotmail.com
References: <YStM2wxtkDAnRemt@user>
From: Pavel Skripkin <paskripkin@gmail.com>
Message-ID: <904b3dc8-fa52-a410-c9d2-f6a1d85487fc@gmail.com>
Date: Sun, 29 Aug 2021 15:08:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YStM2wxtkDAnRemt@user>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/29/21 12:01 PM, Saurav Girepunje wrote:
> Remove the condition with no effect (if == else) and group multiple
> cases which execute same statement in rtw_mlme_ext.c
> 
> Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>

Reviewed-by: Pavel Skripkin <paskripkin@gmail.com>


