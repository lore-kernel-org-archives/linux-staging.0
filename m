Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28171168CC
	for <linux-staging@lists.linux.dev>; Tue, 30 May 2023 10:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685442512;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2b1AE976whQJl3Q7EHB138HWP9PHu2abmZeSJSchDMM=;
	b=KwutZo1eJRzm66m4m0P2JLMWaAwoKS5igfZAeLhKmV/9/uUpR2Q26jmYwre+uObUgRB6rp
	cS7O8ArW8auBB5aCClUPpMgDqhBoM0WZMLErwhSGra7PVsrt1V6z2eujdyxsE4arZ3Wth1
	1ez6wRIMXx2sXFFJHi0AUERYVobfXqc=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-46-oPee_lHoPROPWH0e9dVHgw-1; Tue, 30 May 2023 06:28:26 -0400
X-MC-Unique: oPee_lHoPROPWH0e9dVHgw-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-513f5318ff2so3426540a12.3
        for <linux-staging@lists.linux.dev>; Tue, 30 May 2023 03:28:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685442505; x=1688034505;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2b1AE976whQJl3Q7EHB138HWP9PHu2abmZeSJSchDMM=;
        b=dAXWokKFbEfEkxPRsJxT9WOgs1r3IxGK45tL5/0VOkQ+ke/G9dbR68ONbRdiOmW8xL
         f+FeO7nDsYm3kYFy4OiyRVcnwjXKko2sgXHmwpDm5z8ZPfM66Byqe0rTzeOI0P87FCzZ
         ikY9eRbamFIrq64gkrnH2E/mg0fvr4L85d4BO6eURuRzditpOybbfEwFBbLUKxRh5aFT
         dEC88WPjy6UxJVaAbSX+WjMRJcTVT3+n3wqB7V6VzwETYyuchLK+1m8aW4VP5AuueqNg
         hMXXYQ7iGxwpePfzupCNzqCbvC+cM8bZr6lPd5nDZ230slnx0Ua/hnfcydvB/71BQvn1
         SxyQ==
X-Gm-Message-State: AC+VfDwleAmdDEnMT1HGEzU7ohZSWB8X26AQ98cjvvaL/9HqnT0e0/sg
	taiEvHa0hVIMEVq8HRfpXt6wgvBZ5WP0YM9BIicjn2Pk7g64zccqxem7qfa9pHSTUIZQ4VITJWK
	U0luhc1ZZBksmNKdw+TSdCSPbhg==
X-Received: by 2002:aa7:d815:0:b0:514:964c:4c42 with SMTP id v21-20020aa7d815000000b00514964c4c42mr1441254edq.8.1685442505174;
        Tue, 30 May 2023 03:28:25 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6qUT7YhhUSNEEOWXHKh1/GHGLG6omqx6SInmX+q9c0x1JLfzHSB+xftFhIHjWmzYOvQyKDIA==
X-Received: by 2002:aa7:d815:0:b0:514:964c:4c42 with SMTP id v21-20020aa7d815000000b00514964c4c42mr1441235edq.8.1685442504893;
        Tue, 30 May 2023 03:28:24 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id p3-20020aa7cc83000000b0050bc7c882bfsm4218865edt.65.2023.05.30.03.28.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 03:28:24 -0700 (PDT)
Message-ID: <c3580ce0-c43f-8918-ad44-56d512c4fd04@redhat.com>
Date: Tue, 30 May 2023 12:28:23 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 21/21] media: atomisp: csi2-bridge: Set PMC clk-rate for
 sensors to 19.2 MHz
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
 Tsuchiya Yuto <kitakar@gmail.com>, Yury Luneff <yury.lunev@gmail.com>,
 Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
 Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20230529103741.11904-1-hdegoede@redhat.com>
 <20230529103741.11904-22-hdegoede@redhat.com>
 <CAHp75Ve6rWtkDowBS7z1f=Ot7h8xmXTws8L+Z3eXEfFum2pBcA@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75Ve6rWtkDowBS7z1f=Ot7h8xmXTws8L+Z3eXEfFum2pBcA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 5/29/23 23:48, Andy Shevchenko wrote:
> On Mon, May 29, 2023 at 1:39 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> The ACPI code takes care of enabling/disabling the PMC clk(s) for
>> the sensors as necessary based on the runtime-pm state of the sensor.
>>
>> But the GMIN code this replaces also set the clk-rate of the PMC clk
>> to 19.2 MHz. At least on BYT devices the PMC clks may come up running
>> at 25 MHz instead of the expected 19.2 MHz.
>>
>> Ensure the sensor clk also runs at the expected 19.2 MHz for sensors
>> using v4l2-async probing by explicitly setting it to 19.2 MHz when
>> enumerating sensors in atomisp_csi2_bridge.c.
> 
> ...
> 
>> +       ret = clk_prepare_enable(clk);
>> +       if (!ret)
>> +               clk_disable_unprepare(clk);
> 
> I'm wondering if _enable / _disable required.


As the comment says the BIOS may have the clock enabled
at boot, the hw won't allow changing the rate while
the clk is enabled and the clk-framework won't
allow calling clk_disable_unprepare(clk) without
first calling clk_prepare_enable().

All the sound/soc/intel/boards/*.c files which are
used on BYT / CHT do the same thing before setting
the codec clk speed.

Regards,

Hans



