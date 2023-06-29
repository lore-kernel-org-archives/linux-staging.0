Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDCC55257
	for <linux-staging@lists.linux.dev>; Thu, 29 Jun 2023 07:40:46 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-4f8775126d3so565897e87.1
        for <linux-staging@lists.linux.dev>; Thu, 29 Jun 2023 00:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688024444; x=1690616444;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aCvItk4u8Xw4TPc4spMvCXobxSAA3eABPXjHkYAUpLk=;
        b=mGf5J/U72KskTBIYc6xsE9KnE4nZCSfHfaoTTDt85NgfJtcCMtgNgeT9haMrujqxha
         MVaMXAYvpRCJbTMoANxKq9pYcjI8IvJY5GkDxhe2bIWzjeqslPn/tpHZXm0xE5cIk8vk
         UYb/b1vYxLWqOv0CkVLMIg31iwRPNIkUYNkdoLM9PJykYRM2t8vgE+7aVIaj+H3iGlvi
         WJu96c6ucRVuH3SINQyvbopFrMPzAjQ9eUdR+7LvIV5J051qPSdxJ5lhPt3L0pN6tA5x
         RTuA+Mo7Ugv0rp6Jgn3Ul5qnfIs7Vnmvz1fbfztoCc8RZHQhXbSHtfpFGdwMw0tKHfxj
         rhwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688024444; x=1690616444;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aCvItk4u8Xw4TPc4spMvCXobxSAA3eABPXjHkYAUpLk=;
        b=dXMRtdixHrV111vX3JM1YK2LtyYCP3GYSwcN1dEmEJo0qZ2gdWHCyWH5NgcRdbhfFw
         9avZ6zt5xhEV/jhVWLpS1YJ9401ALe5OUD575DwzmhmjwlUZ7p7HTnt6aErOqur4CRxy
         OM34AIuRucUiT7pPuRXuAMiFQ/1b4BY0+7w7CyPg4kcXajzprx+Yb8U0GtkJavKZmSdi
         8iu2hkANlI5Ui/ESQoX8/rVDM46mmQ1nNl23zYS9ll8Mx9VsroT2s4HcwBYcd525AAxY
         ik2bxtSJuoYNvG2UQaMaxFt0DQPjC3l9fN7zH2IdUvpcV+sRwKeNw7X9cklDl6KRLCdU
         Zk3A==
X-Gm-Message-State: AC+VfDw6A+ihfqvygEg3aYMn/l/ksxQsfLrAvRqIjYWSZkASIgyhiru2
	WIFKnVWAB4WaJ4iF+qCDxnME4g==
X-Google-Smtp-Source: ACHHUZ6doX7XGPh1+1+eyZ2/srAvhhvcgcZPj05VEWkTdYaXdBArzu//8SA5d8E51LReLnOtU4E8ew==
X-Received: by 2002:a05:6512:2348:b0:4fb:897e:21cc with SMTP id p8-20020a056512234800b004fb897e21ccmr5582764lfu.67.1688024444614;
        Thu, 29 Jun 2023 00:40:44 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id p20-20020a1c7414000000b003fa973e6612sm10644148wmc.44.2023.06.29.00.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 00:40:43 -0700 (PDT)
Date: Thu, 29 Jun 2023 10:40:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Franziska =?iso-8859-1?Q?N=E4pelt?= <franziska.naepelt@googlemail.com>
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	eperi1024@gmail.com, hdegoede@redhat.com, quic_vjakkam@quicinc.com,
	johannes.berg@intel.com, tegongkang@gmail.com,
	gregkh@linuxfoundation.org
Subject: Re: [PATCH v3 0/3] Fix some checkpatch issues
Message-ID: <69a90f88-634a-4126-8d33-e770fcc4b686@kadam.mountain>
References: <20230625155632.32403-1-franziska.naepelt@gmail.com>
 <7caa96fb-4fb6-fb87-5d0c-fa6985fa127b@gmail.com>
 <CAAUT3iM7eAYH5AcN=Ko9jDstEUGqXxG7Q6qjp4O9qF_e2WkUVQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAUT3iM7eAYH5AcN=Ko9jDstEUGqXxG7Q6qjp4O9qF_e2WkUVQ@mail.gmail.com>

On Wed, Jun 28, 2023 at 06:38:03PM +0200, Franziska Näpelt wrote:
> 
> Do you want me to submit v4 to fix the email address as well as the subject of
> the cover letter or are you ok with me promising to make it properly the next
> time? ;)

Philipp is not the person to ask, it's Greg.

Yes, you are going to need to resend because of the email address thing.

Probably the cover letter is not a reason to resend, but since you are
resending then please fix that as well.

The reason why we insist that you resend is a couple things:
1) This is a checkpatch change to staging so we assume that you're just
   doing it to learn how patches are supposed to be sent.  So this is an
   educational opportunity.  ;)
2) Greg maintains staging, usb, serial and -stable.  He's super busy.
   It doesn't scale to hand edit patches.  Some maintainers are less
   busy so they can fix trivial stuff like this but in staging you will
   need to resend.  Also if it were a security fix maybe I would step
   in and help you fix your patch but since it's just a checkpatch thing
   no one is going to edit your patch.

Right now the merge window is open so Greg isn't going to see your patch
for a few weeks.  When he does he will press the button on his keyboard
which sends an automatic reply about the email address thing and deletes
the thread from his inbox.

regards,
dan carpenter
