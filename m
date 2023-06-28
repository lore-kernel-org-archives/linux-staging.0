Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF00BA32
	for <linux-staging@lists.linux.dev>; Wed, 28 Jun 2023 20:17:50 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5183075a5ecso3774a12.0
        for <linux-staging@lists.linux.dev>; Wed, 28 Jun 2023 13:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687983468; x=1690575468;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mcdcu/X3rvKEweORiM1Bmj6FQklcqIusFWzpaLNxjw8=;
        b=M0mobyy+a1mpb9FR5GvFkRFbuDFWqG2lIKK4qIzcLoRtiEwGPqshjHF1dAh7QUvpyd
         w9ZQSmGvPH9mCfPCGVzbQF6mW83VuhBVpe7XFJuwVcjk9QuKgZBYmitBZIAPjzJ27FFK
         3JBovOivuHwDrDc3X40QaQ+BNl3j/jHJRzB+gk3VtIFeQUeMSyGNtvbJ3Bv9/dRiip4w
         QFBtuSTcEprudmc2eUn8NI6CkhVk6bCr6zSHEQDFkdPmq93sQo8xPihuqFayUjobVl08
         qwHJZr5Vb9yxcaqAfy3ynHmh2vkiW2vTGK7bWPVgQUnq7UX9hIjxHnQEmQR707JptHhV
         tiwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687983468; x=1690575468;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mcdcu/X3rvKEweORiM1Bmj6FQklcqIusFWzpaLNxjw8=;
        b=PYAvYtEyhtEZNvMvVi7Yzavfxbn+rsBBdJCAu+ySxZPuqiGjVSoKnJ7vrBQqh4v56f
         Z/Rz3/mqT+X7sHVCgwf/a/Gp9ZchbGInVMdVZg8Gw+R/UWP4EUdp8U5jGXSSPKgJxer3
         me5gtE7Gb81OFSuUWFOwBTNwcfdloBbUJ51cZYxd3InXXl58UdChzBgdzOmbnNhd0g2V
         hyklYRUU4knvNSpfdATsJrV1ySyMb1h/bViB8QizDMdApT2u9oNCvFBw9RMfT2X1Hrg4
         oIFV2pq9mHFHPY6bgk1fMYmSCrjusGbVB+nwJ/RaWKOo+33xpv90Twdikfc2PTxyuHpo
         pooA==
X-Gm-Message-State: ABy/qLbbBbexP+bOn43ggftUwNb5K7M5/HX1TXqH3rMgmaisSjCynUbz
	jdvrMdyehreVJwc4Yb2PsVM=
X-Google-Smtp-Source: APBJJlFWqOEcMZcIUebKXKysYKVZS4fqqeBHyIYI9EqdnShb8WVRVzC4oMjuOqF5ZcDF0qXU0uzrlg==
X-Received: by 2002:a05:6402:4407:b0:51d:b9b9:62b4 with SMTP id y7-20020a056402440700b0051db9b962b4mr686042eda.4.1687983468344;
        Wed, 28 Jun 2023 13:17:48 -0700 (PDT)
Received: from [192.168.0.103] (p57ba2e0b.dip0.t-ipconnect.de. [87.186.46.11])
        by smtp.gmail.com with ESMTPSA id c20-20020aa7df14000000b0051d984e610esm3538697edy.66.2023.06.28.13.17.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jun 2023 13:17:45 -0700 (PDT)
Message-ID: <8d065458-b6c7-e388-6768-76a875ed1036@gmail.com>
Date: Wed, 28 Jun 2023 22:17:34 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 0/3] Fix some checkpatch issues
To: =?UTF-8?Q?Franziska_N=c3=a4pelt?= <franziska.naepelt@googlemail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 eperi1024@gmail.com, hdegoede@redhat.com, quic_vjakkam@quicinc.com,
 johannes.berg@intel.com, tegongkang@gmail.com, gregkh@linuxfoundation.org
References: <20230625155632.32403-1-franziska.naepelt@gmail.com>
 <7caa96fb-4fb6-fb87-5d0c-fa6985fa127b@gmail.com>
 <CAAUT3iM7eAYH5AcN=Ko9jDstEUGqXxG7Q6qjp4O9qF_e2WkUVQ@mail.gmail.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <CAAUT3iM7eAYH5AcN=Ko9jDstEUGqXxG7Q6qjp4O9qF_e2WkUVQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/28/23 18:38, Franziska Näpelt wrote:
> Hi Philipp,
> 
> Am Mo., 26. Juni 2023 um 19:09 Uhr schrieb Philipp Hortmann
> <philipp.g.hortmann@gmail.com>:
>>
>> On 6/25/23 17:56, Franziska Naepelt wrote:
>>> This is a series of patches to fix some trivial checkpatch issues. Not all
>>> issues have been fixed. I intend to submit another series to fix more stuff.
>>>
>>> Testing:
>>>
>>> ---
>>> v3: Series to contain only remaining patches.
>>>
>>> Franziska Naepelt (3):
>>>     staging: rtl8723bs: Fix space issues
>>>     staging: rtl8723bs: Fix alignment open parenthesis
>>>     staging: rtl8723bs: Fix remaining blank line issue
>>>
>>>    .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 164 +++++++++---------
>>>    1 file changed, 85 insertions(+), 79 deletions(-)
>>>
>>> --
>>> 2.39.2 (Apple Git-143)
>>>
>>>
>>
>> checkpatch prints the following warning:
>> WARNING: From:/Signed-off-by: email address mismatch: 'From: Franziska
>> Naepelt <franziska.naepelt@googlemail.com>' != 'Signed-off-by: Franziska
>> Naepelt <franziska.naepelt@gmail.com>'
>>
>> I propose you change the git email matching the one that you use to send.
>>
>> When testing you can compile the driver with this command:
>> make -C . M=drivers/staging/rtl8723bs
>> Typically a compile of the entire kernel is not required.
>>
>> Please use the subsystem and driver also for the Subject line of the
>> cover letter.
>>
>> Bye Philipp
> 
> Do you want me to submit v4 to fix the email address as well as the subject of
> the cover letter or are you ok with me promising to make it properly the next
> time? ;)
> 
> Thanks,
> Franziska

Hi Franziska,
you do not need to submit v4 for me.

Here the reason what you need to take into account.

If you leave the e-mail addresses this way you need to monitor both for 
the next weeks. Because somebody(or a robot) may contact you for 
questions, errors or hints for improvement.

If you look into the kernel patch statistics:
http://www.remword.com/kps_result/all_petop.html
Look in google for: "kernel patch statistics"
You can find this person:
Franziska Naepelt <franziska ! naepelt () idt ! com> 
1(0.00%)	@IDT                             @Unknown
May be this is you. Maybe you want to see the number of patches in total 
that you have submitted. That is best possible if you submit all patches 
under one Email address.

May be you plan to vote for the Technical Advisory Board. Then you need 
to collect your patches (credits under one email address)

So all your choice.

Bye Philipp






