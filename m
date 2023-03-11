Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14737B;
	Sat, 11 Mar 2023 14:51:54 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id f11so7573809wrv.8;
        Sat, 11 Mar 2023 06:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678546313;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NTyGiahvzsQx6sDWzDztFd/3tHnrkFadviqDemTjFAk=;
        b=VmrcOQrYSwQV3GHhymuNbikfTIPRLft+zy76bG4/a3MqV/JVBXU69qGUvIgLsWKGEf
         be5WfHPnRlIcwA15+6ctfzo+8hL2sLPtktBjekIXX+Ql0QtpFxFwsg6GwxLIEzHo6Jy3
         jSGEr/aWYJo4jC4OuX540W0v5Vj2BOh9oOBUVwhvRVVo1BH1FRlG8QNIA7087XE3B78b
         JOyjY45LBBov+aFy9nW6tM4fH+bjaCPzAOfw2ZIWcHuDrKoRwyqGmrGb1MKPDoYGGjhX
         hFvpNWkIPgm+BpooacQKs+hu4Eubkbpe0npHNYYBW7oJu0MKSOAVNSWoP6zQjfIe3CP3
         wQsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678546313;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NTyGiahvzsQx6sDWzDztFd/3tHnrkFadviqDemTjFAk=;
        b=dna4+b6ikvahkv9YWfsidVuz2HzKwdpr81ZymE5PmGTxIhl1XjSQCBtbjwkYcIYIw/
         3NJDTboI0Lgnow8FLjvXxcBgwGvnwi6d+IMdFTnIifcyiD7VaWozXmyZx63VKucyS9kZ
         kxaemhE1Lokt1R17EyahGMM44ZtlCWxdkkf1/q7ZlTy8wuzGlNX3eECyLflZjtYhfT9C
         ajoolbzDdU5/DZXvm9XsFA/9Ot5ozf30h4TywSGnRPyz5odVwbl18Th53DyeBhy1d9Ot
         Xc4wXpeA+w2AhP2lnx1D/3u+l45QVs2igEWNrd3fUWXkQC33du0Doq+sjQLK5dlzObWD
         wWTA==
X-Gm-Message-State: AO0yUKWOZYHkco69y3SRdniZ9lZsfV3SgvLNcB0MS0ZaFeFtVtTkDg0Z
	AQht0CXCItfXZ+s8DAPbvxc=
X-Google-Smtp-Source: AK7set98xG33fG+YUFZ6RdmVhMIXKcq9Ng+RDMAMc2Pv4Ch44mmJ8SD+JritEW9jgWY6pN++H95bnw==
X-Received: by 2002:adf:ff92:0:b0:2c9:6562:232b with SMTP id j18-20020adfff92000000b002c96562232bmr18070401wrr.2.1678546312881;
        Sat, 11 Mar 2023 06:51:52 -0800 (PST)
Received: from [192.168.1.16] ([41.42.191.171])
        by smtp.gmail.com with ESMTPSA id r14-20020adff70e000000b002c5804b6afasm2527762wrp.67.2023.03.11.06.51.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Mar 2023 06:51:52 -0800 (PST)
Message-ID: <c9ae27dc-3538-5432-6a6d-3e2ff034f467@gmail.com>
Date: Sat, 11 Mar 2023 16:51:50 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] staging: greybus: eclose macro in a do - while loop
To: Dan Carpenter <error27@gmail.com>
Cc: outreachy@lists.linux.dev, pure.logic@nexus-software.ie,
 johan@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org,
 greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20230311135919.9129-1-eng.mennamahmoud.mm@gmail.com>
 <10d2c15b-ff9f-4634-a013-7640c93435a7@kili.mountain>
Content-Language: en-US
From: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
In-Reply-To: <10d2c15b-ff9f-4634-a013-7640c93435a7@kili.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On ١١‏/٣‏/٢٠٢٣ ١٦:٠٦, Dan Carpenter wrote:
> On Sat, Mar 11, 2023 at 03:59:19PM +0200, Menna Mahmoud wrote:
>> " ERROR: Macros with multiple statements should be enclosed in a do -
>> while loop"
>>
>> Reported by checkpath.
>>
>> do loop with the conditional expression set to a constant
>> value of zero (0).This creates a loop that
>> will execute exactly one time.This is a coding idiom that
>> allows a multi-line macro to be used anywhere
>> that a single statement can be used.
>>
>> So, enclose `gb_loopback_stats_attrs` macro in do - while (0) to
>> fix checkpath error
>>
>> Signed-off-by: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
>> ---
> This breaks the build.  You need to compile the code before sending a
> patch.
>
> regards,
> dan carpenter


I see, I thought building the file only enough. appreciate your feedback.


Thanks,

Menna


