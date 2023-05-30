Received: from hust.edu.cn (mail.hust.edu.cn [202.114.0.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46BA4819
	for <linux-staging@lists.linux.dev>; Tue, 30 May 2023 01:17:18 +0000 (UTC)
Received: from [IPV6:2001:250:4000:5122:716f:f7f7:9d52:5f22] ([172.16.0.254])
	(user=dzm91@hust.edu.cn mech=PLAIN bits=0)
	by mx1.hust.edu.cn  with ESMTP id 34U1F5td003739-34U1F5te003739
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
	Tue, 30 May 2023 09:15:06 +0800
Message-ID: <680d83a5-22fa-4851-b82d-ca59b67c5ad2@hust.edu.cn>
Date: Tue, 30 May 2023 09:11:55 +0800
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] media: atomisp: move the sanity checks before variable
 dereferences
Content-Language: en-US
To: Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
References: <20230529152136.11719-1-dzm91@hust.edu.cn>
 <ef8e411b-c326-9d24-c4f0-96cd183a9d1f@redhat.com>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <ef8e411b-c326-9d24-c4f0-96cd183a9d1f@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-FEAS-AUTH-USER: dzm91@hust.edu.cn



On 5/29/23 23:46, Hans de Goede wrote:
> Hi,
> 
> On 5/29/23 17:21, Dongliang Mu wrote:
>> Smatch reports:
>>
>> sh_css_load_firmware() warn: variable dereferenced before check 'fw_data'
>>
>> The variable fw_data can be NULL in sh_css_load_firmware, resulting in
>> NULL pointer dereference.
>>
>> Fix this by moving the sanity checks before variable dereferences.
>>
>> Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>
> 
> Thank you for your patch, but the same patch has already been submitted
> and merged into my media-atomisp branch about a week ago:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/commit/?h=media-atomisp&id=c09907049eea9f12e959fb88c02a483a4c5eee89

I see. Thanks for your reply.

> 
>> ---
>>   drivers/staging/media/atomisp/pci/sh_css_firmware.c | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/staging/media/atomisp/pci/sh_css_firmware.c b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
>> index e7ef578db8ab..38b757c3df0a 100644
>> --- a/drivers/staging/media/atomisp/pci/sh_css_firmware.c
>> +++ b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
>> @@ -229,6 +229,10 @@ sh_css_load_firmware(struct device *dev, const char *fw_data,
>>   	struct sh_css_fw_bi_file_h *file_header;
>>   	int ret;
>>   
>> +	/* some sanity checks */
>> +	if (!fw_data || fw_size < sizeof(struct sh_css_fw_bi_file_h))
>> +		return -EINVAL;
>> +
>>   	firmware_header = (struct firmware_header *)fw_data;
>>   	file_header = &firmware_header->file_header;
>>   	binaries = &firmware_header->binary_header;
>> @@ -243,10 +247,6 @@ sh_css_load_firmware(struct device *dev, const char *fw_data,
>>   		IA_CSS_LOG("successfully load firmware version %s", release_version);
>>   	}
>>   
>> -	/* some sanity checks */
>> -	if (!fw_data || fw_size < sizeof(struct sh_css_fw_bi_file_h))
>> -		return -EINVAL;
>> -
>>   	if (file_header->h_size != sizeof(struct sh_css_fw_bi_file_h))
>>   		return -EINVAL;
>>   
