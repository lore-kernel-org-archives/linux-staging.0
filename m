Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6007B100C4
	for <linux-staging@lists.linux.dev>; Fri, 23 Jun 2023 17:20:48 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-51be90024f7so190789a12.0
        for <linux-staging@lists.linux.dev>; Fri, 23 Jun 2023 10:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687540846; x=1690132846;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wm1WVoIbn3lR/yYEwl05EQlAoyEzS9kcMhjBtJTS530=;
        b=Qgmk66gpXSiGi9NZhO6CuX/XFzR7A1R0Tm6p/GxMbmWSmO0O4mXQgeQYAha59aNOW7
         nySIl2nAiMoGJrC/XIqueQdWfDmG5MY6UOOAbAnOrnJ+rXNCswAWECNzhMYhnOAOra8r
         rN/O4Kkq/6kNhfk4D41p3+oAquI+iHN1UhQcRUE3EMG9mKkZ7mRxMRqeP+bBXAZG046O
         9Bu9qYMIQM6TXHfiH8KRj/lJ2n1uOrYw3H+02zVyLiaLu59Aw0b9MGTtoYsPgr9/EYP8
         EfZK2VzRw0r6HeBuCLx0c1N1zC+7n4v0n3q27s7VKKBJG5TzjV+5rsH/5rc96FuI9qLb
         yBxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687540846; x=1690132846;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wm1WVoIbn3lR/yYEwl05EQlAoyEzS9kcMhjBtJTS530=;
        b=IAgCGjJcMPE2OeJkTvPSJvIVWjW7FclLvjos/OzdhFKWgOSI32w+iLQJMo9PWuMYx/
         UkEtH5tJgUoPYDLsTG7AE0c/a9Ul+SZW24Pq/yl1TFzUFZkaWLx9IIX3tv6FMfXNNoni
         ChSslblHBNCKhdwrtrG4hEVNyUf14Sw3HgLKFaHFsBIUIuWGbAMqfnAcDrC70MPSqbh2
         /cmPu22BadT5avKHqvDp8NM8QHcY2sXWKsU6QaXGnP7Ip7C9Z2qh1zt6cy1PNj6M90B1
         oH3eNDx34womN5OmoZ0+aRvNdG/9mPsOOu0ax3KIp1DO4A63d+Zvb3EEt8uDgZWE5unl
         jLWg==
X-Gm-Message-State: AC+VfDwe6ImHkPVLU+dzP6dC8sxn0QVn841JNA0L+wj+YYuc8aXAaHO0
	bRklY+TUJ9ouKN3TLUJuTTQ=
X-Google-Smtp-Source: ACHHUZ6liZZCJdt+mtGxv5CyN1Yl6kvTStu+cUKc2NRwZ0GEhpbyH8XanIfHLIfaEBG58yvuWzKt0g==
X-Received: by 2002:a17:906:73cc:b0:98d:b10f:f3cd with SMTP id n12-20020a17090673cc00b0098db10ff3cdmr591020ejl.7.1687540846180;
        Fri, 23 Jun 2023 10:20:46 -0700 (PDT)
Received: from [192.168.0.103] (p57ba2e0b.dip0.t-ipconnect.de. [87.186.46.11])
        by smtp.gmail.com with ESMTPSA id a20-20020a170906369400b0094e7d196aa4sm6163147ejc.160.2023.06.23.10.20.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jun 2023 10:20:44 -0700 (PDT)
Message-ID: <2d1ba862-961c-ec91-3a28-7f2f221b90d4@gmail.com>
Date: Fri, 23 Jun 2023 19:20:42 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 0/5] Fix some checkpatch issues
To: Franziska Naepelt <franziska.naepelt@googlemail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 eperi1024@gmail.com, hdegoede@redhat.com, quic_vjakkam@quicinc.com,
 johannes.berg@intel.com, tegongkang@gmail.com,
 Franziska Naepelt <franziska.naepelt@gmail.com>,
 Greg KH <gregkh@linuxfoundation.org>
References: <20230621184635.25064-1-franziska.naepelt@gmail.com>
 <2023062306-reload-squeezing-633a@gregkh>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <2023062306-reload-squeezing-633a@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/23/23 10:18, Greg KH wrote:
> On Wed, Jun 21, 2023 at 08:46:35PM +0200, Franziska Naepelt wrote:
>> This is a series of patches to fix some trivial checkpatch issues. Not all
>> issues have been fixed. I intend to submit another series to fix more stuff.
> 
> None of these apply to my staging-next branch :(
>

Hi,

this is the repo and branch I use:

git remote show origin
* remote origin
   Fetch URL: 
git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git
...
git branch -a
my branch: staging-testing

Bye Philipp
