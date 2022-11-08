Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2678F44
	for <linux-staging@lists.linux.dev>; Tue,  8 Nov 2022 09:35:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27D30C433D6;
	Tue,  8 Nov 2022 09:35:55 +0000 (UTC)
Message-ID: <bf7dc5f6-acf3-73f0-b73b-d5707152190b@xs4all.nl>
Date: Tue, 8 Nov 2022 10:35:54 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: patches for staging:media drivers
Content-Language: en-US
To: Deepak R Varma <drv@mailo.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Dan Carpenter <error27@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
References: <Y2eSCZJNWn6DzCUu@qemulion>
 <48f4bda9-b5e3-9649-aab9-b529889bf110@linaro.org> <Y2oO7fU4whKr+3hb@kadam>
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <Y2oO7fU4whKr+3hb@kadam>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Deepak,

On 11/8/22 09:10, Dan Carpenter wrote:
> On Mon, Nov 07, 2022 at 06:29:30PM +0100, Neil Armstrong wrote:
>> Hi,
>>
>> On 06/11/2022 11:52, Deepak R Varma wrote:
>>> Greetings to all.
>>> My name is Deepak R Varma and I was part of the recent Outreachy internship
>>> round. I learned during this program that patches for the media drivers were
>>> prohibited to be included in the Outreachy effort due to lack of bandwidth for
>>> the maintainers to respond on those.
>>>
>>> The Outreachy round is now over but I am continuing to work on code improvement
>>> and changes. I would like to know if it is okay for me to now identify
>>> opportunities in the media drivers and send patch proposal for your kind
>>> consideration. I intend to send couple of Coccinelle identified code
>>> improvements as patches.
>>>
>>> Please let me know.
>>
>> I won't say no but since the media maintainers will need to apply them,
>> the problem is the same.
> 
> Yeah.  Me either.  Those rules are for Outreachy so they don't apply to
> anyone else, but at the same time no one is going to Ack your patches
> without seeing them and especially for a subsystem they don't maintain.
> 
> I always try to think about if maintainers will want my patches.  Like
> I sometimes see people returning -1 instead of -ENOMEM but, you know,
> unless it reaches user space it's not technically a bug.  You can't go
> around fixing everyone's bad taste.  But everyone likes bug fixes.
> 
> regards,
> dan carpenter
> 

I don't mind taking patches for media staging drivers as long as:

1) they are not for atomisp, and
2) they are not for deprecated drivers (drivers/staging/media/deprecated/)

Regards,

	Hans
