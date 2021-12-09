Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8FF2C80
	for <linux-staging@lists.linux.dev>; Thu,  9 Dec 2021 17:52:16 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id n33-20020a05600c502100b0032fb900951eso7166729wmr.4
        for <linux-staging@lists.linux.dev>; Thu, 09 Dec 2021 09:52:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Bd8+kTrTfhFU5QWPnGzZKoBEXJcLIGbK/BR+H+0gbYw=;
        b=XbFa42nnAwDGxO66/HbO3nB2gPzLqX2MOc+1zouWEXl3y62x+JQixZnni2tTWFd1CI
         mFZs+VL2zwSM+nOzrmeBxhvLkGHZZUO24TnH0JAKdpbly1p+jK6L5LOjAaTq7kqR70/q
         dH/ZA0AQho791bypxmO/O605uUfAUi5Mam0+utMXeo2MO9Zr3FJNU8Mb3QX+q7RFD06O
         DfNKHxZ4UU4Cor8daNfV2JclnpukSCkUS0TXtEkM+6bjsBMz8CJpl5Q9x2jJe4KLtejM
         ggJMrX5P1niJ6l+JHs2F/aRrfM8IxpyGzvibQ/im15eeGdFDrxxN8oLO5Odg1QHUWYb2
         YngA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=Bd8+kTrTfhFU5QWPnGzZKoBEXJcLIGbK/BR+H+0gbYw=;
        b=s0YGE+YKA6R03DneYAoXVzzvhrJmMgmIXePsXwY9kza2DUDfBFGXYic0SqnXwiVy7S
         cv/B1xkmzk3AjWEAtUzXjwzHAOVkh3jaXv40NxWYtLdhxf5IVcvs/gHTdbU2dOSE2v4y
         ns6Dzac++l/4mnH8bkUbN5Opy9qM0QR82pO1C31n75YmpQLiqhE/raMYuHEKB9mHyeGi
         Mm3WEvEhaLOUVJ3tkiPJtkfWZK61mH9xjJ7Ye96j79LFO6jBPAuGB8PWo8/FU0kPJk2l
         03j0cncBS0S3NHRXi3CqF29MPw3uIwS9sn0KePjafl2m0X7/jdDgZacF9eW07V+f/LNL
         J3Bw==
X-Gm-Message-State: AOAM532e2PqJ69ZvazwBX7b6chYSIZjQkPPWyEruUYk7h8MZ55Y/M3QH
	v12/2NSqKuUFgfNWBoyxYP80/w==
X-Google-Smtp-Source: ABdhPJyMie+a/YOeewKo1Obvu7zuEr3tSxdpZfoN/rSq9A/nErVJDjjw8oiP8Y9G/3nEDK98Fbtfqg==
X-Received: by 2002:a05:600c:3b27:: with SMTP id m39mr9397831wms.132.1639072334313;
        Thu, 09 Dec 2021 09:52:14 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:ee1f:92e9:bcbf:be87? ([2001:861:44c0:66c0:ee1f:92e9:bcbf:be87])
        by smtp.gmail.com with ESMTPSA id b197sm449999wmb.24.2021.12.09.09.52.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Dec 2021 09:52:13 -0800 (PST)
Subject: Re: [PATCH] media: meson: vdec: potential dereference of null pointer
To: Hans Verkuil <hverkuil@xs4all.nl>, Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 mchehab@kernel.org, gregkh@linuxfoundation.org, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com
Cc: linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20211209085840.2081024-1-jiasheng@iscas.ac.cn>
 <bfd1801c-9d1e-0574-a237-711d3d5ae755@xs4all.nl>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <0c1fadf0-e7ba-fb7a-822d-6787f78faaad@baylibre.com>
Date: Thu, 9 Dec 2021 18:52:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <bfd1801c-9d1e-0574-a237-711d3d5ae755@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

On 09/12/2021 12:58, Hans Verkuil wrote:
> On 09/12/2021 09:58, Jiasheng Jiang wrote:
>> he return value of kzalloc() needs to be checked.
>> To avoid use of null pointer in case of the failure of alloc.
>>
>> Fixes: 876f123b8956 ("media: meson: vdec: bring up to compliance")
>> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
>> ---
>>  drivers/staging/media/meson/vdec/vdec_helpers.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/staging/media/meson/vdec/vdec_helpers.c b/drivers/staging/media/meson/vdec/vdec_helpers.c
>> index 7f07a9175815..025885fcfec6 100644
>> --- a/drivers/staging/media/meson/vdec/vdec_helpers.c
>> +++ b/drivers/staging/media/meson/vdec/vdec_helpers.c
>> @@ -234,6 +234,8 @@ void amvdec_add_ts(struct amvdec_session *sess, u64 ts,
>>  	unsigned long flags;
>>  
>>  	new_ts = kzalloc(sizeof(*new_ts), GFP_KERNEL);
>> +	if (!new_ts)
>> +		return;
> 
> While this avoids dereferencing a NULL pointer, this error isn't propagated to the
> caller. And I'm not sure if that's right.
> 
> Neil, what should be done in this case?
> 
> Regards,
> 
> 	Hans
> 
>>  	new_ts->ts = ts;
>>  	new_ts->tc = tc;
>>  	new_ts->offset = offset;
>>
> 

Probably something like this:

===================><=============================
diff --git a/drivers/staging/media/meson/vdec/esparser.c b/drivers/staging/media/meson/vdec/esparser.c
index db7022707ff8..df733eff9ac7 100644
--- a/drivers/staging/media/meson/vdec/esparser.c
+++ b/drivers/staging/media/meson/vdec/esparser.c
@@ -328,7 +328,11 @@ esparser_queue(struct amvdec_session *sess, struct vb2_v4l2_buffer *vbuf)

        offset = esparser_get_offset(sess);

-       amvdec_add_ts(sess, vb->timestamp, vbuf->timecode, offset, vbuf->flags);
+       ret = amvdec_add_ts(sess, vb->timestamp, vbuf->timecode, offset, vbuf->flags);
+       if (ret) {
+               v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_ERROR);
+               return ret;
+       }
        dev_dbg(core->dev, "esparser: ts = %llu pld_size = %u offset = %08X flags = %08X\n",
                vb->timestamp, payload_size, offset, vbuf->flags);

diff --git a/drivers/staging/media/meson/vdec/vdec_helpers.c b/drivers/staging/media/meson/vdec/vdec_helpers.c
index b9125c295d1d..593b2ccbece2 100644
--- a/drivers/staging/media/meson/vdec/vdec_helpers.c
+++ b/drivers/staging/media/meson/vdec/vdec_helpers.c
@@ -227,13 +227,15 @@ int amvdec_set_canvases(struct amvdec_session *sess,
 }
 EXPORT_SYMBOL_GPL(amvdec_set_canvases);

-void amvdec_add_ts(struct amvdec_session *sess, u64 ts,
-                  struct v4l2_timecode tc, u32 offset, u32 vbuf_flags)
+int amvdec_add_ts(struct amvdec_session *sess, u64 ts,
+                 struct v4l2_timecode tc, u32 offset, u32 vbuf_flags)
 {
        struct amvdec_timestamp *new_ts;
        unsigned long flags;

        new_ts = kzalloc(sizeof(*new_ts), GFP_KERNEL);
+       if (!new_ts)
+               return -ENOMEM;
        new_ts->ts = ts;
        new_ts->tc = tc;
        new_ts->offset = offset;
diff --git a/drivers/staging/media/meson/vdec/vdec_helpers.h b/drivers/staging/media/meson/vdec/vdec_helpers.h
index 88137d15aa3a..4bf3e61d081b 100644
--- a/drivers/staging/media/meson/vdec/vdec_helpers.h
+++ b/drivers/staging/media/meson/vdec/vdec_helpers.h
@@ -56,8 +56,8 @@ void amvdec_dst_buf_done_offset(struct amvdec_session *sess,
  * @offset: offset in the VIFIFO where the associated packet was written
  * @flags: the vb2_v4l2_buffer flags
  */
-void amvdec_add_ts(struct amvdec_session *sess, u64 ts,
-                  struct v4l2_timecode tc, u32 offset, u32 flags);
+int amvdec_add_ts(struct amvdec_session *sess, u64 ts,
+                 struct v4l2_timecode tc, u32 offset, u32 flags);
 void amvdec_remove_ts(struct amvdec_session *sess, u64 ts);

 /**
