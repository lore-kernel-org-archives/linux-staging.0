Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C20A1B3946
	for <linux-staging@lists.linux.dev>; Mon,  4 Nov 2024 11:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730721454; cv=none; b=pZcxz0FB7wd7hKQmfIdS17WBwDt2mbxiNuOdt1Vaezd0rR9Q8wsF6TSL96wDPvSgtCOPheYNPtLFVZLKC9Xv/3ocVeGaY2VgysHepJ6SDCu/bgi0NN87XKR9jvoD9jjlzxVU/dyWy6VfE3oMb4HQ5FEiEKnGhiscwNTt68f+Ezc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730721454; c=relaxed/simple;
	bh=ENuI8Cw+fc45b8DadsxhaxUTJ73WEwlP/Ka2eaHGpOI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UGOFMDByWel78GRDUahyu7Nv4Z35A1uG1Se2WxXM/LwgE0CYPy+NfaXsraAVevNXwkjlxXEqUDMy+SrZobwuU37SPSa940b8HF3GFvPXXAXF6N6TfmoJTix57NlCGHE4PRyFZvjtN0xt89di5Mao6/E1x9ya91c/muIfzHCoKvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NVPREdKE; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NVPREdKE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730721452;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yOUaF/LBlXePtFdPHT2PhSoD7banoABF7wTWnj8GaP4=;
	b=NVPREdKEoyHTVQAIeuyq4KIeZDJfSogPYpSCcrtUpL6LSONf4RXlbSYB9PIT10isoJ+xY3
	r4tRhvP9SPJhb+ZNxtpl4b2BJ7fBcS6AqRv/4DLfIk9yttPxljIYJ1wOWVhQv0BT0qsWLr
	gy7M7enmeFB1puyJ1cSwlGsV6Sfe3GE=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-341-z_SeGN32MJ6TMGS_zKgGPw-1; Mon, 04 Nov 2024 06:57:31 -0500
X-MC-Unique: z_SeGN32MJ6TMGS_zKgGPw-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-5c936f71759so2928273a12.2
        for <linux-staging@lists.linux.dev>; Mon, 04 Nov 2024 03:57:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730721450; x=1731326250;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yOUaF/LBlXePtFdPHT2PhSoD7banoABF7wTWnj8GaP4=;
        b=BWFx/jAMpx8lJHcwOP+DbhFmmKZdr7nXj7UDxPk+cr5GgU8mrk9tnJQdSXEtV0DQO+
         NdNuayqzh8VdxQ7mjxjPeZiZL3q4D/A5LqLeyO51blzwz8QbCK00ur6GeKGvjnWpeWBv
         tfp2jGQYHfB9bSG0pRkIH4BdFUeg5bAjIADQfD+iptrqCPw6GdO+6VT2ndl+AZ0SksrK
         zFOdSkmP7nxYGeL0hoqOTIi6gJ+6BB5Tv8X6cbWYnXSI541TeR1T15KbiG/S6EwxXifx
         H8tHu/b7ELjOfI7Nypd3f2OO4fUN9BMEOyto+qZ1IiTwx0xgRqX1PfFwj9M9mlQsGdt3
         DWjw==
X-Forwarded-Encrypted: i=1; AJvYcCU4/YH2KBZFlFBzR41e6XT8kXEb/uN9DwKF9pmAwPcWAVn/jAVk3Yh8l3c5YnKoVOlktzXQfuqEmuSHah/m@lists.linux.dev
X-Gm-Message-State: AOJu0YzdLtg2LVbcF49hTTq6e9UjE9J4eEA6qvGneMq80a/1o6PCliyg
	tOQp9xU7Fum7n8bf8YlXEhweoh16B9vPD4n3dITcEp3PFnJxnO94D4jjwaSv2cAv/gxUBgSl1hd
	KXbT1xD9q3l6l97w/o0sG7gvP8N0dSuvzR+ltOX1mczqO2ulohpdpetqHhlgxLxE=
X-Received: by 2002:a05:6402:35c8:b0:5ce:cbce:ccc8 with SMTP id 4fb4d7f45d1cf-5cecbcecf56mr5248325a12.23.1730721449941;
        Mon, 04 Nov 2024 03:57:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGBxV3ubhOD/t9qcuefF+ocLU88HRE6GgFgESC9OXnkrbEfTlnFFXEQQHxM3atfUKG07wwwqQ==
X-Received: by 2002:a05:6402:35c8:b0:5ce:cbce:ccc8 with SMTP id 4fb4d7f45d1cf-5cecbcecf56mr5248290a12.23.1730721449480;
        Mon, 04 Nov 2024 03:57:29 -0800 (PST)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ceac789bf2sm4123335a12.45.2024.11.04.03.57.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2024 03:57:28 -0800 (PST)
Message-ID: <28958f62-9051-45a6-a26d-585508e2bd11@redhat.com>
Date: Mon, 4 Nov 2024 12:57:27 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] media: atomisp: Remove License information
 boilerplate
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jeff Johnson <quic_jjohnson@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Jonathan Bergh <bergh.jonathan@gmail.com>,
 Roshan Khatri <topofeverest8848@gmail.com>,
 Dipendra Khadka <kdipendra88@gmail.com>,
 Sergio de Almeida Cipriano Junior <sergiosacj@riseup.net>,
 Kent Overstreet <kent.overstreet@linux.dev>,
 Kartik Kulkarni <kartik.koolks@gmail.com>,
 Kathara Sasikumar <katharasasikumar007@gmail.com>,
 Tchadel Icard <hello@tchadelicard.fr>, Kate Hsuan <hpa@redhat.com>,
 Colin Ian King <colin.i.king@gmail.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20240923105539.3569110-1-andriy.shevchenko@linux.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240923105539.3569110-1-andriy.shevchenko@linux.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 23-Sep-24 12:53 PM, Andy Shevchenko wrote:
> We have the respective SPDX identifiers that are already being applied
> to the files in question. Remove the License information boilerplate.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thank you for your patch(es).

I have merged this/these in my media-atomisp branch:
https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp

And this/these will be included in my next pull-request to
Mauro (to media subsystem maintainer)

Regards,

Hans


